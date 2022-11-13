package com.example.cupcake.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "NavigateToHomepage", value = "/NavigateToHomepage")
public class NavigateToHomepage extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/homepage.jsp").forward(request, response);
    }
}
