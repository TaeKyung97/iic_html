#!/bin/bash

# --- 1. 환경 변수 설정 (본인 경로에 맞게 꼭 확인하세요!) ---
# 프로젝트가 있는 폴더 경로 (git clone 받은 곳)
PROJECT_PATH="/home/tk/iic-project" 

# 톰캣 설치 경로 (사용자가 알려준 경로 반영)
TOMCAT_HOME="/opt/apache-tomcat-11.0.10"
TOMCAT_WEBAPPS="$TOMCAT_HOME/webapps"

# 컴파일에 필요한 라이브러리 경로 (사용자가 알려준 명령어 반영)
# 프로젝트 내부 lib와 톰캣 lib를 모두 포함
CLASSPATH="webapp/WEB-INF/lib/*:$TOMCAT_HOME/lib/*"

echo "=== 배포 자동화 스크립트 시작 ==="

# --- 2. 프로젝트 폴더로 이동 ---
echo "> 프로젝트 폴더로 이동: $PROJECT_PATH"
cd $PROJECT_PATH || { echo "경로 이동 실패! 스크립트를 종료합니다."; exit 1; }

# --- 3. Git Pull (최신 코드 받기) ---
echo "> Git Pull 수행 (최신 소스 가져오기)"
git pull origin main

# --- 4. 기존 클래스 파일 정리 (Clean) ---
# 컴파일 전에 기존에 컴파일된 파일들을 지워주는 게 안전합니다.
echo "> 기존 컴파일된 클래스 파일 삭제 (Clean)"
rm -rf webapp/WEB-INF/classes/com

# --- 5. 자바 소스 컴파일 (Javac) ---
# 사용자가 준 명령어를 변수 등을 활용해 그대로 적용
echo "> 자바 소스 컴파일 시작..."

# 컴파일된 클래스가 들어갈 폴더가 없으면 생성
mkdir -p webapp/WEB-INF/classes

javac -d webapp/WEB-INF/classes \
      -cp "$CLASSPATH" \
      src/com/iiclab/util/*.java \
      src/com/iiclab/dto/*.java \
      src/com/iiclab/dao/*.java \
      src/com/iiclab/controller/*.java

# 컴파일 성공 여부 확인 ($?는 바로 앞 명령어의 종료 코드를 의미. 0이면 성공)
if [ $? -ne 0 ]; then
    echo "ERROR: 컴파일에 실패했습니다. 배포를 중단합니다."
    exit 1
fi
echo "> 컴파일 성공!"

# --- 6. 톰캣으로 배포 (파일 복사) ---
# WAR를 만들지 않으므로, webapp 폴더의 내용을 통째로 톰캣 ROOT로 복사합니다.
echo "> 톰캣으로 파일 배포 (Copying files to Tomcat...)"

# 톰캣 끄기 (파일 덮어쓰기 전 안전하게)
# systemctl을 쓴다면: sudo systemctl stop tomcat
# 쉘 스크립트로 켠다면:
$TOMCAT_HOME/bin/shutdown.sh
sleep 3 # 완전히 꺼질 때까지 3초 대기

# 기존 ROOT 폴더 내용 비우기 (찌꺼기 파일 방지)
rm -rf $TOMCAT_WEBAPPS/ROOT/*

# 우리 프로젝트의 webapp 내용을 톰캣 ROOT로 복사
cp -r webapp/* $TOMCAT_WEBAPPS/ROOT/

# --- 7. 톰캣 재시작 ---
echo "> 톰캣 재시작..."
# systemctl을 쓴다면: sudo systemctl start tomcat
# 쉘 스크립트로 켠다면:
$TOMCAT_HOME/bin/startup.sh

echo "=== 배포 완료! ==="
