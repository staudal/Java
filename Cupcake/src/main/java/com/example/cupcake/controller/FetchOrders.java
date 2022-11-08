package com.example.cupcake.controller;

import com.example.cupcake.Mappers.OrderMapper;
import com.example.cupcake.model.Order;
import com.example.cupcake.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "FetchOrders", value = "/FetchOrders")
public class FetchOrders extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        OrderMapper mapper = new OrderMapper();

        ArrayList<Order> orders = mapper.getOrders(user);
        request.getSession().setAttribute("orders", orders);
        request.getRequestDispatcher("WEB-INF/orders.jsp").forward(request, response);
    }
}
