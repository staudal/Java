package com.example.servlettemplate.controller;

import com.example.servlettemplate.model.Cupcake;
import com.example.servlettemplate.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "Order", value = "/Order")
public class Order extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");

        String bottom = request.getParameter("bottom");
        String topping = request.getParameter("topping");
        int amount = Integer.parseInt(request.getParameter("amount"));

        user.getBasket().addCupcakeToBasket(new Cupcake(topping, bottom), amount);

        request.getSession().setAttribute("user", user);
        request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
    }
}
