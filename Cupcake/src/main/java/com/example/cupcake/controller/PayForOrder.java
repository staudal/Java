package com.example.cupcake.controller;

import com.example.cupcake.Mappers.CakeMapper;
import com.example.cupcake.Mappers.OrderMapper;
import com.example.cupcake.model.Order;
import com.example.cupcake.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "PayForOrder", value = "/PayForOrder")
public class PayForOrder extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        Order order = new Order(user, user.getBasket().getTotalPrice() + 5, user.getBasket().getCupcakes());
        OrderMapper orderMapper = new OrderMapper();
        CakeMapper cakeMapper = new CakeMapper();
        orderMapper.insertOrderIntoDatabase(order);
        cakeMapper.addCakesToDatabase(order);
        request.getRequestDispatcher("WEB-INF/orders.jsp").forward(request, response);
    }
}