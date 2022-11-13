package com.example.cupcake.controller;

import com.example.cupcake.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "NavigateToHomepage", value = "/NavigateToHomepage")
public class NavigateToHomepage extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");

        if (user.getRole().equals("admin")) {
            request.getRequestDispatcher("WEB-INF/admin/homepage.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("WEB-INF/homepage.jsp").forward(request, response);
        }
    }
}
