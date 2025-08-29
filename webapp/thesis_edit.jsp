<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>논문/문서 수정 - IIC 연구실</title>
    <link rel="stylesheet" href="thesis_edit.css">
</head>
<body>
    <header class="header"> ... </header>
    <main class="main">
        <section class="section">
            <div class="container">
                <div class="upload-form-container">
                    <form action="thesis?action=update" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="id" value="${thesis.id}">
                        <div class="form-group">
                            <input type="text" name="title" value="${thesis.title}" required>
                            <input type="text" name="authors" value="${thesis.authors}" required>
                        </div>
                        <div class="form-group">
                            <select name="category" required>
                                <option value="International Journals" ${thesis.category eq 'International Journals' ? 'selected' : ''}>국제 학술지</option>
                                <option value="Domestic Journals" ${thesis.category eq 'Domestic Journals' ? 'selected' : ''}>국내 학술지</option>
                                <option value="Conference Papers" ${thesis.category eq 'Conference Papers' ? 'selected' : ''}>학술대회</option>
                                <option value="구노문서" ${thesis.category eq '구노문서' ? 'selected' : ''}>구노문서</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <textarea name="journal" rows="3" required>${thesis.journal}</textarea>
                        </div>
                        <div class="form-group">
                            <p>현재 파일: ${thesis.fileName}</p>
                            <label for="file">파일 변경 (선택 사항):</label>
                            <input type="file" name="file" id="file">
                        </div>
                        <button type="submit" class="btn-submit">수정 완료</button>
                        <a href="thesis?action=list" class="btn-cancel">취소</a>
                    </form>
                </div>
            </div>
        </section>
    </main>
</body>
</html>

