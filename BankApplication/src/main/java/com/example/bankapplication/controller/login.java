package com.example.bankapplication.controller;

import com.example.bankapplication.error.ErrorHandler;
import com.example.bankapplication.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "login", value = "/login")
public class login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = new User();
        ErrorHandler errorHandler = new ErrorHandler();

        try {
            if (!user.userExists(username)) {
                request.setAttribute("usernameErrorMessage", errorHandler.usernameDoesNotExist());
                request.setAttribute("usernameErrorClass", errorHandler.errorClass());
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else if (!user.correctPassword(username, password)) {
                request.setAttribute("passwordErrorMessage", errorHandler.wrongPassword());
                request.setAttribute("passwordErrorClass", errorHandler.errorClass());
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else if (user.userExists(username) && user.correctPassword(username, password)) {
                request.setAttribute("username", username);
                request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
