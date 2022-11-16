package com.example.cupcake.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LoadAccount", value = "/LoadAccount")
public class LoadAccount extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String setting = request.getParameter("setting");
        if (setting.equals("account")) {
            request.getRequestDispatcher("WEB-INF/account.jsp").forward(request, response);
        } else {
            request.getSession().invalidate();
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
