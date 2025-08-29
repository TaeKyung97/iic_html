package com.iiclab.controller;

import com.iiclab.dao.GraduatedResearcherDao;
import com.iiclab.dao.ResearcherDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

// 파일 업로드가 없으므로 @MultipartConfig 어노테이션 삭제
@WebServlet("/researcher")
public class ResearcherController extends HttpServlet {

    private final ResearcherDao researcherDao = new ResearcherDao();
    private final GraduatedResearcherDao graduatedResearcherDao = new GraduatedResearcherDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // action과 관계없이 항상 목록 페이지만 보여주도록 단일화
        request.setAttribute("undergraduates", researcherDao.getResearchersByStatus("학부생"));
        request.setAttribute("graduates", researcherDao.getResearchersByStatus("대학원생"));
        request.setAttribute("alumni", graduatedResearcherDao.getAllGraduatedResearchers());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/researcher.jsp");
        dispatcher.forward(request, response);
    }

    // 데이터를 추가/수정하던 doPost 메서드는 더 이상 필요 없으므로 전체 삭제
}
