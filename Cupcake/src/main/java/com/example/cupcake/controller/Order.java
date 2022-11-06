package com.example.cupcake.controller;

import com.example.cupcake.model.Cupcake;
import com.example.cupcake.model.User;
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

        Cupcake cupcake = new Cupcake(topping, bottom);
        user.getBasket().addCupcakeToBasket(cupcake, amount);
        System.out.println(cupcake.getBottomPrice());
        System.out.println(cupcake.getToppingPrice());
        System.out.println(cupcake.getBottomName());
        System.out.println(cupcake.getToppingName());

        request.getSession().setAttribute("user", user);
        request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
    }
}
