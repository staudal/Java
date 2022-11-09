package com.example.cupcake.controller;

import com.example.cupcake.model.Bottom;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "SaveBottom", value = "/SaveBottom")
public class SaveBottom extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bottomName = request.getParameter("bottom");
        int bottomPrice = 0;

        if (bottomName.equals("Chokolade")) {
            bottomPrice = 5;
        } else if (bottomName.equals("Vanilje")) {
            bottomPrice = 5;
        } else if (bottomName.equals("Muskatnød")) {
            bottomPrice = 5;
        } else if (bottomName.equals("Pistacie")) {
            bottomPrice = 6;
        } else if (bottomName.equals("Mandel")) {
            bottomPrice = 7;
        }

        Bottom bottom = new Bottom(bottomName, bottomPrice);

        request.getSession().setAttribute("bottom", bottom);
        request.getRequestDispatcher("WEB-INF/stepTwo.jsp").forward(request, response);
    }
}
