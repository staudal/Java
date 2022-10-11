package com.example.todoapplication.controller;

import com.example.todoapplication.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet (name = "addTodo", value = "/addTodo")
public class addTodo extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Defining variables and parameters
        String todoItem = request.getParameter("todoItem");
        User user = (User) request.getSession().getAttribute("user");

        // Performing action
        user.getTodoList().insertNewTodo(todoItem, user);

        // Setting scopes and sending to page
        request.getSession().setAttribute("user", user);
        request.setAttribute("todoList", user.getTodoList().getTodoList());
        request.setAttribute("todoCount", user.getTodoList().getTodoCount());
        request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
    }
}
