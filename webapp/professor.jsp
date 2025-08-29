<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>연구실 교수 소개</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="professor.css">
</head>
<body> <header class="header">
        <div class="container">
            <a href="index.jsp"><img src="photo/iic.png" alt="IIC 로고" class="logo"></a>
            <nav class="nav">
                <a href="index.jsp" class="nav-link">메인</a>
                <a href="researcher.jsp" class="nav-link">연구원</a>
                <a href="activities.jsp" class="nav-link">대외활동</a>
            </nav>
        </div>
    </header>

    <div class="prof-container">
        <aside class="prof-card" aria-label="교수 프로필 카드">
            <div class="prof-photo">
                <img src="photo/oh.png" alt="교수 사진" class="prof-photo-img">
            </div>
            <div class="prof-card-info">
                <h2>오명훈 교수 <span class="prof-role">/ 학과장</span></h2>
                <dl class="prof-contact-info">
                    <div><dt>연락처</dt> <dd>062-940-5284</dd></div>
                    <div><dt>교수실</dt> <dd>창조관(8호관) 8510호</dd></div>
                    <div><dt>이메일</dt> <dd>mhoh@honam.ac.kr</dd></div>
                    <div><dt>전공 및 <br>강의</dt> <dd>컴퓨터구조, <br>IoT 컴퓨팅,<br>디지털논리회로,<br>리눅스시스템</div>
                </dl>
            </div>
        </aside>

        <main class="prof-sections" role="main">

            <section class="prof-section" aria-labelledby="education-title">
                <h3 id="education-title" class="prof-section-title">학력</h3>
                <ul class="prof-list">
                    <li>전남대 컴퓨터공학과 학사 (1997)</li>
                    <li>전남대 컴퓨터공학과 석사 (1999)</li>
                    <li>광주과학기술원(GIST) 정보통신공학과 박사 (2005)</li>
                </ul>
            </section>

            <section class="prof-section" aria-labelledby="career-title">
                <h3 id="career-title" class="prof-section-title">경력</h3>
                <ul class="prof-list">
                    <li>현 호남대학교 컴퓨터공학과 조교수 (2021.3~현재)</li>
                    <li>ITU-T SG13 에디터 (2012~현재)</li>
                    <li>한국전자통신연구원(ETRI) 책임연구원 (2005~2021)</li>
                    <li>과학기술연합대학원대학교(UST) 겸임교수 (2006~2020)</li>
                    <li>Univ. of Manchester 방문연구원 (2001~2002)</li>
                </ul>
            </section>

            <section class="prof-section" aria-labelledby="patents-title">
                <h3 id="patents-title" class="prof-section-title">특허</h3>
                <ul class="prof-list">
                    <li>Myeong-Hoon Oh, "DATA TRANSMISSION APPARATUS ...," Patent Number 9521016, 2016.12.13, US</li>
                    <li>"APPARATUS AND METHOD FOR VIRTUAL DESKTOP SERVICE," Patent Number 9489227, 2016.11.08, US, ITU-T Y.3503 표준특허 승인 2014</li>
                    <li>Myeong-Hoon Oh 등, "ASYNCHRONOUS PIPELINE SYSTEM ...," Patent Number 9317295, 2016.04.19, US</li>
                    <li>외 국내외 50여건 등록</li>
                </ul>
            </section>

            <section class="prof-section" aria-labelledby="activities-title">
                <h3 id="activities-title" class="prof-section-title">학회 및 기관 활동</h3>
                <ul class="prof-list">
                    <li>한국인터넷방송통신학회, 한국멀티미디어학회, 대한전자공학회, 한국통신학회</li>
                    <li>TTA 클라우드컴퓨팅 PG1003 간사 (2013~현재)</li>
                    <li>TTA 클라우드 전략맵 분과장 (2021~현재)</li>
                    <li>한국 ITU 연구위원회 (2012~현재)</li>
                    <li>All@CLOUD 포럼 위원 (2014~현재)</li>
                    <li>지능형컴퓨팅포럼 전문위원 (2022~현재)</li>
                </ul>
            </section>

            <section class="prof-section" aria-labelledby="awards-title">
                <h3 id="awards-title" class="prof-section-title">수상 및 포상</h3>
                <ul class="prof-list">
                    <li>2003.05, IEEE SSCS/EDS 서울 지부 Best paper award</li>
                    <li>2008.11, 차세대컴퓨팅학회 Best paper award</li>
                    <li>2010.11, Marquis Who's Who in the World 등재</li>
                    <li>2011.06, UST 우수교수상</li>
                    <li>2011.11, SoC Design Conference Dongbu Hitek 논문상</li>
                    <li>2016.11, 과기정통부 클라우드컴퓨팅 유공 포상</li>
                    <li>2017.12, 대한공학한림원(NAEK) Award</li>
                    <li>2022.11, 컴퓨팅기기산업 유공 포상 (과기정통부)</li>
                </ul>
            </section>

            <section class="prof-section" aria-labelledby="research-title">
                <h3 id="research-title" class="prof-section-title">현재 연구분야</h3>
                <ul class="prof-list">
                    <li>임베디드시스템</li>
                    <li>클라우드 컴퓨팅</li>
                    <li>엣지 컴퓨팅</li>
                    <li>지능형 에이전트</li>
		    <li>Physical AI</li>
                </ul>
            </section>

            <section class="prof-section prof-section-papers" aria-labelledby="papers-title">
                <h3 id="papers-title" class="prof-section-title">주요 논문</h3>
                <ul class="prof-list">
                    <li>Design and Implementation of Asynchronous Processor on FPGA, IEEE Access, Vol. 10, pp. 118370-118379, Nov. 2022 (SCIE)</li>
                    <li>Gen-Z memory pool system implementation and performance measurement, ETRI Journal, Vol. 44, No.3, pp. 450-461, June 2022 (SCIE)</li>
                    <li>Multi-Communication Layered HPL Model and its Application to CPU Clusters, ETRI Journal, Vol. 43, No. 3, pp. 524-537, June 2021 (SCIE)</li>
                    <li>Hardware Implementation and Analysis of Gen-Z Protocol for Memory-Centric Architecture, IEEE Access, Vol. 8, pp. 127244-127253, July 2020. (SCIE)</li>
                    <li>Appropriate Synchronization Time Allocation for Distributed Heterogeneous Parallel Computing Systems, KSII TRANSACTIONS ON INTERNET AND INFORMATION SYSTEMS, Vol. 13, No. 11, pp. 5446-5453, Nov. 2019 (SCIE)</li>
                    <li>Signal integrity analysis of system interconnection module of high-density server supporting serial RapidIO, ETRI Journal Wiley Online Library, April 2019. (SCIE)</li>
                    <li>외 SCIE급 국제 저널 논문 10여편, 국제학술대회 논문 30여편, KCI급 국내 저널 논문 20여편, 국내학술대회 논문 40여편 게재</li>
                </ul>
            </section>

        </main> </div> <footer class="footer">
        <div class="container">
            <p><strong>찾아오는 길:</strong> 62399 광주광역시 광산구 호남대길 112 호남대학교 창조관(8호관) 8503 연구실</p>
            <div class="footer-info">
                <p><strong>연구실 책임자 (오명훈 교수):</strong> 062-940-5284 / mhoh@honam.ac.kr</p>
                <p><strong>연구실 담당자 (김영준):</strong> kimyjok@naver.com</p>
                <p>&copy; 2025 IIC Laboratory, Honam University. All rights reserved.</p>
            </div>
        </div>
    </footer>
</body> 
</html>
