#!/bin/bash

# --- AWS Private Server 환경 설정 ---
# 1. 경로: ec2-user로 수정됨
PROJECT_PATH="/home/ec2-user/iic-project"
TOMCAT_HOME="/opt/tomcat"

# 2. 라이브러리: Tomcat 10 (Jakarta)용으로 완벽하게 지정
CLASSPATH="$TOMCAT_HOME/lib/servlet-api.jar:$TOMCAT_HOME/lib/jsp-api.jar:$TOMCAT_HOME/lib/el-api.jar:webapp/WEB-INF/lib/*"

echo "=== 배포 자동화 스크립트 시작 ==="

# 1. 최신 코드 받기
echo "> 프로젝트 폴더로 이동: $PROJECT_PATH"
cd $PROJECT_PATH || exit 1

echo "> Git Pull 수행 (최신 소스 가져오기)"
git pull origin main

# 2. 컴파일 (폴더 생성 및 javac 실행)
echo "> 기존 컴파일된 클래스 파일 삭제 (Clean)"
rm -rf webapp/WEB-INF/classes
mkdir -p webapp/WEB-INF/classes

echo "> 자바 소스 컴파일 시작..."
javac -d webapp/WEB-INF/classes \
      -cp "$CLASSPATH" \
      src/com/iiclab/util/*.java \
      src/com/iiclab/dto/*.java \
      src/com/iiclab/dao/*.java \
      src/com/iiclab/controller/*.java

if [ $? -eq 0 ]; then
    echo "COMPILATION SUCCESS! (컴파일 성공)"
else
    echo "ERROR: 컴파일에 실패했습니다. 배포를 중단합니다."
    exit 1
fi

# 3. 배포 (ROOT 덮어쓰기)
echo "> 톰캣 재시작 및 배포..."
$TOMCAT_HOME/bin/shutdown.sh
sleep 3
rm -rf $TOMCAT_HOME/webapps/ROOT/*
cp -r webapp/* $TOMCAT_HOME/webapps/ROOT/
$TOMCAT_HOME/bin/startup.sh

echo "=== 배포 완료 ==="
