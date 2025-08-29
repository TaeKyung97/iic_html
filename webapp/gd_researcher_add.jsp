<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>IIC 연구실 - 졸업생 추가</title>
    <link rel="stylesheet" href="gd_researcher_add.css">
</head>
<body>
    <header class="header">
        <div class="container">
            <a href="index.jsp"><img src="photo/iic.png" alt="IIC Lab Logo" class="logo"></a>
            <nav class="nav">
                 <a href="index.jsp" class="nav-link">메인</a>
                <a href="researcher.jsp" class="nav-link">연구원</a>
            </nav>
        </div>
    </header>
    <main class="container">
        <div class="form-container">
            <h1 class="form-title">졸업생 추가</h1>
            <form action="graduatedResearcher?action=add" method="post" class="data-form">
                <div class="form-group">
                    <label for="name">이름</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="student_number">학번</label>
                    <input type="text" id="student_number" name="student_number" required>
                </div>
                <div class="form-group">
                    <label for="grade">졸업 년/월</label>
                    <input type="text" id="grade" name="grade" placeholder="예: 24년 8월" required>
                </div>
                <div class="form-group">
                    <label for="employment_place">취업/진학처</label>
                    <input type="text" id="employment_place" name="employment_place">
                </div>
                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">저장</button>
                    <a href="researcher.jsp" class="btn btn-secondary">취소</a>
                </div>
            </form>
        </div>
    </main>
</body>
</html>
