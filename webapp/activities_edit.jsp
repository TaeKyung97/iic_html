<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>대외 활동 수정</title>
    <link rel="stylesheet" href="activities_edit.css">
</head>
<body>
    <header class="header">
        <div class="container">
            <a href="index.jsp"><img src="photo/iic.png" alt="IIC Lab Logo" class="logo"></a>
            <nav class="nav">
                <a href="index.jsp" class="nav-link">메인</a>
                <a href="researcher?action=list" class="nav-link">연구원</a>
            </nav>
        </div>
    </header>
    <main class="container">
        <div class="form-container">
            <h1 class="main-title">대외 활동 수정</h1>
            <form method="post" action="activity?action=update">
                <input type="hidden" name="id" value="${activity.id}">
                <div class="form-group">
                    <label for="activity_type">활동 형태</label>
                    <select id="activity_type" name="activity_type" onchange="toggleSections()">
                        <option value="1" ${activity.activityType == 1 ? 'selected' : ''}>논문 + 대회</option>
                        <option value="2" ${activity.activityType == 2 ? 'selected' : ''}>대회(수상만)</option>
                        <option value="3" ${activity.activityType == 3 ? 'selected' : ''}>논문만</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="title">활동 제목</label>
                    <input type="text" id="title" name="title" value="${activity.title}" required>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="start_date">시작일</label>
                        <input type="date" id="start_date" name="start_date" value="<fmt:formatDate value="${activity.startDate}" pattern="yyyy-MM-dd"/>" required>
                    </div>
                    <div class="form-group">
                        <label for="end_date">종료일</label>
                        <input type="date" id="end_date" name="end_date" value="<fmt:formatDate value="${activity.endDate}" pattern="yyyy-MM-dd"/>">
                    </div>
                </div>
                <div id="competition_name_group" class="form-group">
                    <label for="competition_name">대회/학회명</label>
                    <input type="text" id="competition_name" name="competition_name" value="${activity.competitionName}">
                </div>
                <div id="competition_result_group" class="form-group">
                    <label for="competition_result">대회 결과</label>
                    <input type="text" id="competition_result" name="competition_result" value="${activity.competitionResult}">
                </div>
                <div id="competition_desc_group" class="form-group">
                    <label for="competition_desc">대회 설명</label>
                    <textarea id="competition_desc" name="competition_desc" rows="5">${activity.competitionDesc}</textarea>
                </div>
                <div class="form-group">
                    <label for="participants">참가자</label>
                    <textarea id="participants" name="participants" rows="3">${activity.participants}</textarea>
                </div>
                <div id="papers_section" class="form-group">
                    <label for="papers">논문/문헌</label>
                    <textarea id="papers" name="papers" rows="5">${activity.papers}</textarea>
                </div>
                <div class="form-actions">
                    <a href="activity?action=list" class="btn btn-secondary">취소</a>
                    <button type="submit" class="btn btn-primary">수정 완료</button>
                </div>
            </form>
        </div>
    </main>
    <script>
        function toggleSections() {
            let type = document.getElementById("activity_type").value;
            document.getElementById('competition_result_group').style.display = (type === '3') ? 'none' : 'block';
            document.getElementById('competition_desc_group').style.display = (type === '3') ? 'none' : 'block';
            document.getElementById('papers_section').style.display = (type === '2') ? 'none' : 'block';
        }
        document.addEventListener('DOMContentLoaded', toggleSections);
    </script>
</body>
</html>

