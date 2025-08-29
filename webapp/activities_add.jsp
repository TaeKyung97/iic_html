<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>대외활동 추가</title>
    <link rel="stylesheet" href="activities_add.css">
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
            <h1 class="main-title">대외활동 추가</h1>
            <form action="activity?action=add" method="post">
                <div class="form-group">
                    <label for="title">활동 제목</label>
                    <input type="text" id="title" name="title" required>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="start_date">시작 날짜</label>
                        <input type="date" id="start_date" name="start_date" required>
                    </div>
                    <div class="form-group">
                        <label for="end_date">종료 날짜</label>
                        <input type="date" id="end_date" name="end_date">
                    </div>
                </div>
                <div class="form-group">
                    <label for="activity_type">활동 형태</label>
                    <select id="activity_type" name="activity_type" onchange="toggleSections()">
                        <option value="1">논문 + 대회</option>
                        <option value="2">대회(수상만)</option>
                        <option value="3">논문만</option>
                    </select>
                </div>
                <div id="competition-section" class="form-section">
                    <h2 class="section-title">대회/학회 정보</h2>
                    <div class="form-group">
                        <label for="competition_name">대회/학회명</label>
                        <input type="text" id="competition_name" name="competition_name">
                    </div>
                    <div class="form-group" id="competition_result_group">
                        <label for="competition_result">대회 결과/수상</label>
                        <input type="text" id="competition_result" name="competition_result">
                    </div>
                    <div class="form-group" id="competition_desc_group">
                        <label for="competition_desc">대회 설명</label>
                        <textarea id="competition_desc" name="competition_desc" rows="4"></textarea>
                    </div>
                </div>
                <div class="form-section">
                    <h2 class="section-title">참가자 정보</h2>
                    <div class="form-group">
                        <label>참가자 (줄바꿈으로 구분)</label>
                        <textarea name="participants" rows="4" placeholder="김영준, 이지은&#10;박서준"></textarea>
                    </div>
                    <div class="form-group papers-input">
                        <label>작성 논문/문헌</label>
                        <textarea name="papers" rows="3" placeholder="1. 논문제목 (저널명, Vol, pp)&#10;2. ..."></textarea>
                    </div>
                </div>
                <div class="form-actions">
                    <a href="activity?action=list" class="btn btn-tertiary">취소</a>
                    <button type="submit" class="btn btn-primary">저장</button>
                </div>
            </form>
        </div>
    </main>
    <script>
        // ## 수정 ##: 사용하지 않는 addAuthorBlock 함수 제거
        function toggleSections() {
            let type = document.getElementById("activity_type").value;

            // 대회 관련 필드
            document.getElementById("competition_result_group").style.display = (type === '3') ? "none" : "block";
            document.getElementById("competition_desc_group").style.display = (type === '3') ? "none" : "block";

            // 논문 관련 필드
            document.querySelectorAll(".papers-input").forEach(el => {
                el.style.display = (type === '2') ? "none" : "block";
            });
        }

        document.addEventListener('DOMContentLoaded', toggleSections);
    </script>
</body>
</html>
