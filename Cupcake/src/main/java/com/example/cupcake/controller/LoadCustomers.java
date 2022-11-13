package com.example.cupcake.controller;

import com.example.cupcake.Mappers.OrderMapper;
import com.example.cupcake.Mappers.UserMapper;
import com.example.cupcake.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.TreeMap;
import java.util.UUID;

@WebServlet(name = "LoadCustomers", value = "/LoadCustomers")
public class LoadCustomers extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserMapper userMapper = new UserMapper();
        OrderMapper orderMapper = new OrderMapper();
        TreeMap<UUID, User> users = userMapper.getAllUsers();
        for (User user : users.values()) {
            user.setOrders(orderMapper.getAllOrdersForUser(user));
        }
        request.getSession().setAttribute("users", users);
        request.getRequestDispatcher("WEB-INF/admin/customers.jsp").forward(request, response);
    }
}
