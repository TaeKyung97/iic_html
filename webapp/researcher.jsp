<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.iiclab.dao.ResearcherDao" %>
<%@ page import="com.iiclab.dao.GraduatedResearcherDao" %>
<%@ page import="com.iiclab.dto.ResearcherDto" %>
<%@ page import="com.iiclab.dto.GraduatedResearcherDto" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    // 스크립틀릿을 사용하여 DAO를 통해 데이터를 가져옵니다.
    ResearcherDao researcherDao = new ResearcherDao();
    GraduatedResearcherDao graduatedResearcherDao = new GraduatedResearcherDao();

    List<ResearcherDto> undergraduates = researcherDao.getResearchersByStatus("학부생");
    List<ResearcherDto> graduates = researcherDao.getResearchersByStatus("대학원생");
    List<GraduatedResearcherDto> alumni = graduatedResearcherDao.getAllGraduatedResearchers();

    // JSP 페이지에서 사용할 수 있도록 pageContext에 데이터를 저장합니다.
    pageContext.setAttribute("undergraduates", undergraduates);
    pageContext.setAttribute("graduates", graduates);
    pageContext.setAttribute("alumni", alumni);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>IIC 연구원 소개</title>
    <link rel="stylesheet" href="researcher.css">
</head>
<body>
<header class="header">
    <div class="container">
        <a href="index.jsp"><img src="photo/iic.png" alt="IIC Logo" class="logo"></a>
        <nav class="nav">
            <a href="index.jsp" class="nav-link">메인</a>
            <a href="professor.jsp" class="nav-link">담당 교수</a>
            <a href="activities.jsp" class="nav-link">대외활동</a>
        </nav>
    </div>
</header>

<main class="main">
    <div class="container">

        <div class="section-block">
            <h2>대학원생</h2>
            <div class="card-list">
                <c:forEach var="r" items="${graduates}">
                    <div class="researcher-card">
                        <div class="researcher-card-img">
                            <c:choose>
                                <c:when test="${not empty r.photo}">
                                    <img src="${r.photo}" alt="${r.name} 사진" class="researcher-photo">
                                </c:when>
                                <c:otherwise>
                                    <div class="researcher-no-photo">사진 없음</div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="researcher-info">
                            <h3>${r.name}</h3>
                            <p>${r.status} ${r.grade}</p>
                            <p>
                                <c:forTokens var="area" items="${r.research_areas}" delims=",">
                                    <span class="badge">${area}</span>
                                </c:forTokens>
                            </p>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${empty graduates}">
                    <p class="no-data">등록된 대학원생이 없습니다.</p>
                </c:if>
            </div>
        </div>

        <div class="section-block">
            <h2>학부생</h2>
            <c:forEach var="grade" items="4,3,2,1">
                <c:set var="found" value="${false}" />
                <%-- 해당 학년에 학생이 있는지 먼저 확인 --%>
                <c:forEach var="r" items="${undergraduates}">
                    <c:if test="${r.grade == grade}">
                        <c:set var="found" value="${true}" />
                    </c:if>
                </c:forEach>

                <%-- 학생이 있을 경우에만 학년 제목과 카드 목록 표시 --%>
                <c:if test="${found}">
                    <div class="grade-group">
                        <h3 class="grade-title">${grade}학년</h3>
                        <div class="card-list">
                            <c:forEach var="r" items="${undergraduates}">
                                <c:if test="${r.grade == grade}">
                                    <div class="researcher-card">
                                        <div class="researcher-card-img">
                                            <c:choose>
                                                <c:when test="${not empty r.photo}">
                                                    <img src="${r.photo}" alt="${r.name} 사진" class="researcher-photo">
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="researcher-no-photo">사진 없음</div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="researcher-info">
                                            <h3>${r.name}</h3>
                                            <p>${r.status} ${r.grade}학년</p>
                                            <p>
                                                <c:forTokens var="area" items="${r.research_areas}" delims=",">
                                                    <span class="badge">${area}</span>
                                                </c:forTokens>
                                            </p>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
            <c:if test="${empty undergraduates}">
                <p class="no-data">등록된 학부생이 없습니다.</p>
            </c:if>
        </div>

        <div class="section-block">
            <h2>졸업생</h2>
            <div class="card-list">
                <c:forEach var="r" items="${alumni}">
                    <div class="researcher-card">
                        <div class="researcher-info">
                            <h3>${r.name}</h3>
                            <p>${r.grade} 졸업</p>
                            <p><span class="badge">${r.employment_place}</span></p>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${empty alumni}">
                    <p class="no-data">등록된 졸업생이 없습니다.</p>
                </c:if>
            </div>
        </div>
    </div>
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
