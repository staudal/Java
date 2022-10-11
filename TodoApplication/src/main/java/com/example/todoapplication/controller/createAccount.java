package com.example.todoapplication.controller;

import com.example.todoapplication.error.ErrorHandler;
import com.example.todoapplication.model.TodoList;
import com.example.todoapplication.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "createAccount", value = "/createAccount")
public class createAccount extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        ErrorHandler errorHandler = new ErrorHandler();
        TodoList todoList = new TodoList();
        User user = new User(username, password, todoList);

        if (user.userExists(user.getUsername())) {
            request.setAttribute("usernameErrorClass", errorHandler.errorClass());
            request.setAttribute("usernameErrorMessage", errorHandler.usernameAlreadyExists());
            request.getRequestDispatcher("createAccount.jsp").forward(request, response);
        } else if (user.getPassword().length() < 5) {
            request.setAttribute("passwordErrorClass", errorHandler.errorClass());
            request.setAttribute("passwordErrorMessage", errorHandler.passwordTooShort());
            request.getRequestDispatcher("createAccount.jsp").forward(request, response);
        } else {
            user.getTodoList().initializeTodoList(user.getTodoList(), user.getUsername());
            user.createUser(user.getUsername(), user.getPassword());
            request.setAttribute("todoList", user.getTodoList().getTodoList());
            request.getSession().setAttribute("user", user);
            request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
        }
    }
}
