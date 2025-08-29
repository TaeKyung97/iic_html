package com.iiclab.controller;

import com.iiclab.dao.ThesisDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

// 파일 업로드가 없으므로 @MultipartConfig 어노테이션 삭제
@WebServlet("/thesis")
public class ThesisController extends HttpServlet {
    private final ThesisDao thesisDao = new ThesisDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // action 파라미터가 없거나 "list"일 경우 항상 목록을 보여주도록 로직 간소화
        try {
            request.setAttribute("theses", thesisDao.getAllTheses());
            request.getRequestDispatcher("/thesis.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    // 데이터를 추가, 수정, 삭제하는 doPost 메서드는 더 이상 필요 없으므로 전체 삭제
}
