package com.example.cupcake.controller;

import com.example.cupcake.model.Bottom;
import com.example.cupcake.model.Topping;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "SaveTopping", value = "/SaveTopping")
public class SaveTopping extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String toppingName = request.getParameter("topping");
        int toppingPrice = 0;

        if (toppingName.equals("Chokolade")) {
            toppingPrice = 5;
        } else if (toppingName.equals("Blåbær")) {
            toppingPrice = 5;
        } else if (toppingName.equals("Hindbær")) {
            toppingPrice = 5;
        } else if (toppingName.equals("Jordbær")) {
            toppingPrice = 6;
        } else if (toppingName.equals("Appelsin")) {
            toppingPrice = 8;
        } else if (toppingName.equals("Citron")) {
            toppingPrice = 8;
        }

        Topping topping = new Topping(toppingName, toppingPrice);

        request.getSession().setAttribute("topping", topping);
        request.getRequestDispatcher("WEB-INF/stepThree.jsp").forward(request, response);
    }
}
