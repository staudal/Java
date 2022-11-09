package com.example.cupcake.controller;

import com.example.cupcake.model.Bottom;
import com.example.cupcake.model.Cupcake;
import com.example.cupcake.model.Topping;
import com.example.cupcake.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AddToBasket", value = "/AddToBasket")
public class AddToBasket extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        Bottom bottom = (Bottom) request.getSession().getAttribute("bottom");
        Topping topping = (Topping) request.getSession().getAttribute("topping");

        Cupcake cupcake = new Cupcake(bottom, topping);
        user.getBasket().addCupcakeToBasket(cupcake);

        request.getSession().setAttribute("user", user);
        request.getRequestDispatcher("WEB-INF/basket.jsp").forward(request, response);
    }
}
