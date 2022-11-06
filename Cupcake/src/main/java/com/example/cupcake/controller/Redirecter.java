package com.example.cupcake.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "Redirecter", value = "/Redirecter")
public class Redirecter extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");

        if (page.equals("dashboard")) {
            request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
        } else if (page.equals("basket")) {
            request.getRequestDispatcher("WEB-INF/basket.jsp").forward(request, response);
        }
    }
}
