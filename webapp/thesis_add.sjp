<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>새 논문 업로드 - IIC 연구실</title>
    <link rel="stylesheet" href="thesis.css">
</head>
<body>
    <header class="header"> ... </header>
    <main class="main">
        <section id="thesis-add" class="section">
            <div class="container">
                <h2 class="section-title">새 논문/문서 업로드</h2>
                <div class="upload-form-container">
                    <form action="thesis?action=add" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <input type="text" name="title" placeholder="논문 제목" required>
                            <input type="text" name="authors" placeholder="저자 (쉼표로 구분)" required>
                        </div>
                        <div class="form-group">
                            <select name="category" required>
                                <option value="">카테고리 선택</option>
                                <option value="International Journals">국제 학술지</option>
                                <option value="Domestic Journals">국내 학술지</option>
                                <option value="Conference Papers">학술대회</option>
                                <option value="구노문서">구노문서</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <textarea name="journal" placeholder="학술지/학회 정보" rows="3" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="file">파일 선택:</label>
                            <input type="file" name="file" id="file" required>
                        </div>
                        <button type="submit" class="btn-submit">업로드</button>
                        <a href="thesis?action=list" class="btn-cancel">취소</a>
                    </form>
                </div>
            </div>
        </section>
    </main>
    <footer class="footer"> ... </footer>
</body>
</html>

