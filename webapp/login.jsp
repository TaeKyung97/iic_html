<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>IIC 연구실 - 로그인</title>
    <link rel="stylesheet" href="login.css">
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

    <main class="login-container">
        <h2>로그인</h2>
        <c:if test="${error == '1'}">
            <p class="error">아이디 또는 비밀번호가 잘못되었습니다.</p>
        </c:if>
        <form action="user?action=login" method="post">
            <div class="form-group">
                <label for="id">아이디</label>
                <input type="text" id="id" name="id" required>
            </div>
            <div class="form-group">
                <label for="pw">비밀번호</label>
                <input type="password" id="pw" name="pw" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn">로그인</button>
            </div>
        </form>
    </main>
</body>
</html>

