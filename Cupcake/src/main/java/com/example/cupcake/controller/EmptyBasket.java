package com.example.cupcake.controller;

import com.example.cupcake.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "EmptyBasket", value = "/EmptyBasket")
public class EmptyBasket extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        user.getBasket().clearBasket();
        request.getRequestDispatcher("WEB-INF/basket.jsp").forward(request, response);
    }
}
