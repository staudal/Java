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

@WebServlet(name = "login", value = "/login")
public class login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        ErrorHandler errorHandler = new ErrorHandler();
        TodoList todoList = new TodoList();
        User user = new User(username, password, todoList);

        if (!user.userExists(user.getUsername())) {
            request.setAttribute("usernameErrorMessage", errorHandler.usernameDoesNotExist());
            request.setAttribute("usernameErrorClass", errorHandler.errorClass());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (!user.correctPassword(user.getUsername(), user.getPassword())) {
            request.setAttribute("passwordErrorMessage", errorHandler.wrongPassword());
            request.setAttribute("passwordErrorClass", errorHandler.errorClass());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (user.userExists(user.getUsername()) && user.correctPassword(user.getUsername(), user.getPassword())) {
            user.getTodoList().initializeTodoList(user.getTodoList(), user.getUsername());
            request.setAttribute("todoList", user.getTodoList().getTodoList());
            request.getSession().setAttribute("user", user);
            request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
        }
    }
}
