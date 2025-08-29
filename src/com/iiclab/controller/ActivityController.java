package com.iiclab.controller;

import com.iiclab.dao.ActivityDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/activity")
public class ActivityController extends HttpServlet {
    private final ActivityDao activityDao = new ActivityDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // action과 관계없이 항상 목록을 조회하도록 로직 간소화
        request.setAttribute("activities", activityDao.getAllActivities());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/activities.jsp");
        dispatcher.forward(request, response);
    }

    // doPost 메서드는 더 이상 필요 없으므로 삭제
}
