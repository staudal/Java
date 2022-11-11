package com.example.cupcake.controller;

import com.example.cupcake.Mappers.OrderMapper;
import com.example.cupcake.model.Cupcake;
import com.example.cupcake.model.Order;
import com.example.cupcake.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.TreeMap;
import java.util.UUID;

@WebServlet(name = "LoadUserOrders", value = "/LoadUserOrders")
public class LoadUserOrders extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        OrderMapper mapper = new OrderMapper();
        TreeMap<UUID, Order> orders = mapper.getAllOrdersForUser(user);

        request.getSession().setAttribute("orders", orders);
        request.getRequestDispatcher("WEB-INF/orders.jsp").forward(request, response);
    }
}
