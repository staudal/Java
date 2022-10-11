package com.example.todoapplication.controller;

import com.example.todoapplication.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet (name = "changeTodo", value = "/changeTodo")
public class changeTodo extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Defining variables and parameters
        int todoId = Integer.parseInt(request.getParameter("todoId"));
        String newTodo = request.getParameter("newTodo");
        User user = (User) request.getSession().getAttribute("user");

        // Performing action
        user.getTodoList().changeTodoItem(todoId, newTodo, user);

        // Setting scopes and sending to page
        request.getSession().setAttribute("user", user);
        request.setAttribute("todoList", user.getTodoList().getTodoList());
        request.setAttribute("todoCount", user.getTodoList().getTodoCount());
        request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
    }
}
