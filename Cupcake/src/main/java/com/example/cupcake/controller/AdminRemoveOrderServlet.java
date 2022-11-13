package com.example.cupcake.controller;

import com.example.cupcake.Mappers.CakeMapper;
import com.example.cupcake.Mappers.OrderMapper;
import com.example.cupcake.Mappers.UserMapper;
import com.example.cupcake.model.Cupcake;
import com.example.cupcake.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

@WebServlet(name = "AdminRemoveOrderServlet", value = "/AdminRemoveOrderServlet")
public class AdminRemoveOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User newUser = (User) request.getSession().getAttribute("newUser");
        UUID orderId = UUID.fromString(request.getParameter("orderId"));
        CakeMapper cakeMapper = new CakeMapper();
        OrderMapper orderMapper = new OrderMapper();

        cakeMapper.removeCupcakesFromOrder(orderId);
        orderMapper.removeOrder(orderId);

        newUser.setOrders(orderMapper.getAllOrdersForUser(newUser));
        request.getSession().setAttribute("newUser", newUser);
        request.getRequestDispatcher("WEB-INF/admin/customerOrders.jsp").forward(request, response);
    }
}
