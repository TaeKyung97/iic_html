<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="create_ac.css">
</head>
<body>
<div class="container">
    <h2>회원가입</h2>
    <c:if test="${not empty errorMsg}">
        <div class="error">${errorMsg}</div>
    </c:if>
    <form action="user?action=register" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="name">이름</label>
            <input type="text" name="name" id="name" required>
        </div>
        <div class="form-group">
            <label for="id">아이디</label>
            <input type="text" name="id" id="id" required>
        </div>
        <div class="form-group">
            <label for="pw">비밀번호</label>
            <input type="password" name="pw" id="pw" required>
        </div>
        <div class="form-group">
            <label for="email">이메일</label>
            <input type="email" name="email" id="email" required>
        </div>
        <div class="form-group">
            <label for="phone">전화번호</label>
            <input type="text" name="phone" id="phone">
        </div>
        <div class="form-group">
            <label for="student_number">학번</label>
            <input type="text" name="student_number" id="student_number" required>
        </div>
        <div class="form-group">
            <label for="grade">학년/직급</label>
            <input type="text" name="grade" id="grade">
        </div>
        <div class="form-group">
            <label for="research_areas">연구 분야</label>
            <input type="text" name="research_areas" id="research_areas">
        </div>
        <div class="form-group">
            <label for="photo">프로필 사진</label>
            <input type="file" name="photo" id="photo" accept="image/*">
        </div>
        <button type="submit" class="btn">가입하기</button>
    </form>
</div>
</body>
</html>

