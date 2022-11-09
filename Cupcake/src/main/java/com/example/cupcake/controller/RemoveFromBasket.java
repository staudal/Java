package com.example.cupcake.controller;

import com.example.cupcake.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "RemoveFromBasket", value = "/RemoveFromBasket")
public class RemoveFromBasket extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        UUID id = UUID.fromString(request.getParameter("cupcake"));

        user.getBasket().removeCupcakeFromBasket(id);

        request.getSession().setAttribute("user", user);
        request.getRequestDispatcher("WEB-INF/basket.jsp").forward(request, response);
    }
}
