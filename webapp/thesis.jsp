<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.iiclab.dao.ThesisDao, com.iiclab.dto.ThesisDto, java.util.List, java.util.ArrayList" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- DB에서 필요한 카테고리의 논문 목록만 가져온 후, 화면 표시를 위해 분리 --%>
<%
    ThesisDao thesisDao = new ThesisDao();
    List<ThesisDto> allTheses = thesisDao.getAllTheses();

    List<ThesisDto> journalPapers = new ArrayList<>();
    List<ThesisDto> conferencePapers = new ArrayList<>();

    for (ThesisDto thesis : allTheses) {
        String category = thesis.getCategory();
        if ("Journal Paper".equals(category)) {
            journalPapers.add(thesis);
        } else if ("Conference Paper".equals(category)) {
            conferencePapers.add(thesis);
        }
    }

    pageContext.setAttribute("journalPapers", journalPapers);
    pageContext.setAttribute("conferencePapers", conferencePapers);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>논문/문서 - IIC 연구실</title>
    <link rel="stylesheet" href="thesis.css">
</head>
<body>
    <header class="header">
        <div class="container">
            <a href="index.jsp"><img src="photo/iic.png" alt="IIC Lab Logo" class="logo"></a>
            <nav class="nav">
                <a href="index.jsp" class="nav-link">메인</a>
                <a href="professor.jsp" class="nav-link">담당 교수</a>
                <a href="researcher.jsp" class="nav-link">연구원</a>
                <a href="activities.jsp" class="nav-link">대외활동</a>
            </nav>
        </div>
    </header>

    <main class="main">
        <section id="thesis" class="section">
            <div class="container">
                <h2 class="section-title">논문 및 문서</h2>

                <div class="thesis-columns-container">
                    <%-- 왼쪽 컬럼: Journal Paper --%>
                    <div class="thesis-column">
                        <h3 class='thesis-category-title'>Journal Paper</h3>
                        <div class='thesis-list'>
                            <c:if test="${empty journalPapers}">
                                <p>등록된 논문이 없습니다.</p>
                            </c:if>
                            <c:forEach var="t" items="${journalPapers}">
                                <div class="thesis-item">
                                    <div class="thesis-info">
                                        <h4 class="thesis-title">${t.title}</h4>
                                        <p class="thesis-authors">${t.authors}</p>
                                        <p class="thesis-meta">
                                            <span class="thesis-date">${t.date}</span>
                                            <c:if test="${not empty t.date and not empty t.location}"> | </c:if>
                                            <span class="thesis-location">${t.location}</span>
                                        </p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <%-- 오른쪽 컬럼: Conference Paper --%>
                    <div class="thesis-column">
                        <h3 class='thesis-category-title'>Conference Paper</h3>
                        <div class='thesis-list'>
                            <c:if test="${empty conferencePapers}">
                                <p>등록된 논문이 없습니다.</p>
                            </c:if>
                            <c:forEach var="t" items="${conferencePapers}">
                                <div class="thesis-item">
                                    <div class="thesis-info">
                                        <h4 class="thesis-title">${t.title}</h4>
                                        <p class="thesis-authors">${t.authors}</p>
                                        <p class="thesis-meta">
                                            <span class="thesis-date">${t.date}</span>
                                            <c:if test="${not empty t.date and not empty t.location}"> | </c:if>
                                            <span class="thesis-location">${t.location}</span>
                                        </p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
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
