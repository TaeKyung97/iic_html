<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.iiclab.dao.ActivityDao" %>
<%@ page import="com.iiclab.dto.ActivityDto" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%-- =============== 스크립틀릿(Scriptlet) 추가 부분 =============== --%>
<%
    // 1. DAO 객체를 생성합니다.
    ActivityDao activityDao = new ActivityDao();

    // 2. DAO를 통해 DB에서 모든 활동 목록을 조회합니다.
    List<ActivityDto> activities = activityDao.getAllActivities();

    // 3. 조회한 데이터를 JSTL이 사용할 수 있도록 "activities"라는 이름으로 저장합니다.
    pageContext.setAttribute("activities", activities);
%>
<%-- ========================================================== --%>

<%-- 관리자 확인 로직 삭제 --%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>IIC 연구실 - 대외 활동</title>
    <link rel="stylesheet" href="activities.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <header class="header">
        <div class="container">
            <a href="index.jsp"><img src="photo/iic.png" alt="IIC Lab Logo" class="logo"></a>
            <nav class="nav">
                <a href="index.jsp" class="nav-link">메인</a>
                <a href="professor.jsp" class="nav-link">담당 교수</a>
                <a href="researcher.jsp" class="nav-link">연구원</a>
            </nav>
        </div>
    </header>

    <main class="container">
        <div class="page-header">
            <h1 class="main-title">연구실 활동</h1>
        </div>

        <div class="table-container">
            <table class="activity-table">
                <thead>
                    <tr>
                        <th>활동 기간</th>
                        <th>구분</th>
                        <th>활동명</th>
                        <th>참가자</th>
                        <th>상세 내용</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty activities}">
                            <c:forEach var="act" items="${activities}">
                                <tr>
                                    <td class="date-cell">
                                        <fmt:formatDate value="${act.start_date}" pattern="yyyy.MM.dd"/>
                                        <c:if test="${not empty act.end_date and act.start_date ne act.end_date}">
                                            <br>~ <fmt:formatDate value="${act.end_date}" pattern="yyyy.MM.dd"/>
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${act.activity_type == 1}"><span class="badge type-1">대회/논문</span></c:when>
                                            <c:when test="${act.activity_type == 2}"><span class="badge type-2">대회</span></c:when>
                                            <c:when test="${act.activity_type == 3}"><span class="badge type-3">논문/학회</span></c:when>
                                            <c:otherwise><span class="badge type-etc">기타</span></c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="title-cell">${act.title}</td>
                                    <td class="participants-cell" style="white-space: pre-line;">${act.participants}</td>
                                    <td class="details-cell">
                                        <c:if test="${not empty act.competition_name}">
                                            <strong>${act.activity_type == 3 ? '개최: ' : '개최: '}</strong>${act.competition_name}<br>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="5" class="no-data">등록된 활동이 없습니다.</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
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
