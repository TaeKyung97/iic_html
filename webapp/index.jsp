<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.iiclab.dao.ActivityDao, com.iiclab.dto.ActivityDto, java.util.List" %>
<%@ page import="com.iiclab.dao.ResearcherDao" %>
<%@ page import="com.iiclab.dao.ThesisDao" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%-- DB에서 실제 카운트를 조회하도록 변경 --%>
<%
    // 1. 각 DAO 객체 생성
    ResearcherDao researcherDao = new ResearcherDao();
    ThesisDao thesisDao = new ThesisDao();
    ActivityDao activityDao = new ActivityDao();

    // 2. 각 DAO의 count 메서드를 호출하여 실제 데이터 개수 조회
    int researcherCount = researcherDao.getResearcherCount();
    int thesisCount = thesisDao.getThesisCount();
    int activitiesCount = activityDao.getActivityCount();

    // 3. 최신 활동 3개 조회 (기존 로직 유지)
    List<ActivityDto> recentActivities = activityDao.getRecentActivities(3);
    pageContext.setAttribute("recentActivities", recentActivities);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>IIC 지능형 정보 컴퓨팅 연구실</title>
    <link rel="stylesheet" href="index.css">
</head>
<body>
    <header class="header">
        <div class="container">
            <a href="index.jsp"><img src="photo/iic.png" alt="IIC Lab Logo" class="logo"></a>
            <nav class="nav">
                <a href="professor.jsp" class="nav-link">담당 교수</a>
                <a href="#about" class="nav-link">연구실 소개</a>
                <a href="#research" class="nav-link">연구 분야</a>
                <a href="researcher.jsp" class="nav-link">연구원</a>
                <a href="activities.jsp" class="nav-link">대외활동</a>
            </nav>
        </div>
    </header>

    <main class="main">
        <section class="hero"> <img src="photo/iic_main.png" alt="IIC Lab Loho"  class="logo_main">
            <div class="container">
                <h1 class="hero-title">지능 정보 컴퓨팅 연구실</h1>
            </div>
        </section>

        <section id="about" class="section">
            <div class="container">
                <div class="about-content">
                    <div class="about-text">
                        <h2 class="section-title" style="text-align: left; margin-bottom: 2rem;">연구실 소개</h2>
                        <p>저희 지능형 정보 컴퓨팅(IIC) 연구실은 임베디드 시스템 및 FPGA 설계 기술을 기반으로 한 고성능 컴퓨팅 시스템과 관련 소프트웨어 기술을 중점적으로 연구하고 있습니다. 급변하는 IT 환경에 대응하여 하드웨어와 소프트웨어의 경계를 넘나드는 창의적이고 실용적인 솔루션을 개발합니다.</p>
                    </div>
                    <div class="stats">
                        <div class="stat-item"><a href="researcher.jsp"><span class="stat-number"><%= researcherCount %></span><span class="stat-label">연구원</span></a></div>
                        <div class="stat-item"><a href="thesis.jsp"><span class="stat-number"><%= thesisCount %></span><span class="stat-label">논문/문서</span></a></div>
                        <div class="stat-item"><a href="activities.jsp"><span class="stat-number"><%= activitiesCount %></span><span class="stat-label">대외 활동</span></a></div>
                        <div class="stat-item"><a href="https://www.goono.so" target="_blank"><span class="stat-number">구노</span></a></div>
                    </div>
                </div>
            </div>
        </section>

        <section id="research" class="section">
            <div class="container">
                <h2 class="section-title">연구 분야</h2>
                <div class="research-item">
                    <div class="research-text">
                        <h3>임베디드 시스템</h3>
                        <p>소형 장치용 하드웨어 및 소프트웨어 설계, 실시간 운영체제, IoT 디바이스 개발 등 다양한 임베디드 기술을 연구하여 실제 산업에 적용 가능한 솔루션을 개발합니다.</p>
                    </div>
                    <div class="research-card">
                        <img src="photo/imb.jpg" alt="임베디드 시스템 사진" class="research-image">
                    </div>
                </div>
                <div class="research-item reverse">
                    <div class="research-text">
                        <h3>FPGA 설계</h3>
                        <p>FPGA를 이용한 하드웨어 가속기 설계, 고속 신호 처리 시스템, 맞춤형 디지털 회로 구현을 통해 특정 연산에 최적화된 고성능 컴퓨팅 환경을 구축합니다.</p>
                    </div>
                    <div class="research-card">
                        <img src="photo/fpga.png" alt="FPGA 설계 사진" class="research-image">
                    </div>
                </div>
                <div class="research-item">
                    <div class="research-text">
                        <h3>클라우드 컴퓨팅</h3>
                        <p>분산 컴퓨팅 아키텍처, 클라우드 기반 인프라 구축 및 운영, 대규모 데이터의 효율적인 처리 및 분석 기술을 연구하여 확장성 높은 서비스를 제공합니다.</p>
                    </div>
                    <div class="research-card">
                        <img src="photo/cloud.png" alt="클라우드 컴퓨팅 사진" class="research-image">
                    </div>
                </div>
            </div>
        </section>

        <section id="active" class="section">
            <div class="container">
                <h2 class="section-title">
                    <a href="activities.jsp">최신 대외 활동</a>
                </h2>
                <div class="news-container">
                    <c:choose>
                        <c:when test="${not empty recentActivities}">
                            <c:forEach var="activity" items="${recentActivities}">
                                <div class="news-item">
                                    <a href="activities.jsp">
                                        <div class="news-date">
                                            <fmt:formatDate value="${activity.start_date}" pattern="yyyy.MM.dd"/>
                                        </div>
                                        <div class="news-content">
                                            ${activity.title}
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <p class="no-data" style="text-align: center;">최근 대외 활동이 없습니다.</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </section>
    </main>

    <footer class="footer">
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
