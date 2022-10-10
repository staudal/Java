package com.example.bankapplication.controller;

import com.example.bankapplication.database.Connection;
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

@WebServlet(name = "createAccount", value = "/createAccount")
public class createAccount extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User();
        ErrorHandler errorHandler = new ErrorHandler();

        try {
            if (user.userExists(username)) {
                request.setAttribute("usernameErrorClass", errorHandler.errorClass());
                request.setAttribute("usernameErrorMessage", errorHandler.usernameAlreadyExists());
                request.getRequestDispatcher("createAccount.jsp").forward(request, response);
            } else if (password.length() < 5) {
                request.setAttribute("passwordErrorClass", errorHandler.errorClass());
                request.setAttribute("passwordErrorMessage", errorHandler.passwordTooShort());
                request.getRequestDispatcher("createAccount.jsp").forward(request, response);
            } else {
                user.createUser(username, password);
                request.setAttribute("username", username);
                request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
