package com.example.cupcake.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LoadCupcakeMaker", value = "/LoadCupcakeMaker")
public class LoadCupcakeMaker extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/stepOne.jsp").forward(request, response);
    }
}
