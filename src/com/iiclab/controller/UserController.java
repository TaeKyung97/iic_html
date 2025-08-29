package com.iiclab.controller;

import com.iiclab.dao.UserDao;
import com.iiclab.dto.UserDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/user")
public class UserController extends HttpServlet {
    private final UserDao userDao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "loginForm"; // 기본 동작
        }

        switch (action) {
            case "loginForm":
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                break;
            case "registerForm":
                request.getRequestDispatcher("/create_ac.jsp").forward(request, response);
                break;
            case "logout":
                HttpSession session = request.getSession(false);
                if (session != null) {
                    session.invalidate();
                }
                response.sendRedirect("index.jsp");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        switch (action) {
            case "login":
                login(request, response);
                break;
            case "register":
                register(request, response);
                break;
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");

        UserDto user = userDao.login(id, pw);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", user.getId());
            session.setAttribute("userName", user.getName());
            session.setAttribute("userRole", user.getRole());
            session.setAttribute("student_number", user.getStudentNumber());
            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute("error", "1");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // 파일 업로드는 ResearcherController 예제를 참고하여 MultipartConfig와 Part 처리를 추가해야 합니다.
        // 여기서는 텍스트 데이터만 처리하는 예시입니다.
        String id = request.getParameter("id");
        String email = request.getParameter("email");
        String studentNumber = request.getParameter("student_number");

        String duplicateField = userDao.checkDuplicate(id, email, studentNumber);
        if (duplicateField != null) {
            request.setAttribute("errorMsg", "이미 사용 중인 " + duplicateField + "입니다.");
            request.getRequestDispatcher("/create_ac.jsp").forward(request, response);
            return;
        }

        UserDto user = new UserDto();
        user.setId(id);
        user.setPw(request.getParameter("pw"));
        user.setName(request.getParameter("name"));
        user.setEmail(email);
        user.setStudentNumber(studentNumber);
        user.setGrade(request.getParameter("grade"));
        user.setResearchAreas(request.getParameter("research_areas"));
        user.setPhone(request.getParameter("phone"));
        // user.setPhoto(...); // 파일 처리 로직 필요

        try {
            userDao.addUser(user);
            response.sendRedirect("user?action=loginForm");
        } catch (SQLException e) {
            request.setAttribute("errorMsg", "회원가입 중 오류가 발생했습니다.");
            request.getRequestDispatcher("/create_ac.jsp").forward(request, response);
        }
    }
}

