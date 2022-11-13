package com.example.cupcake.controller;

import com.example.cupcake.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.TreeMap;
import java.util.UUID;

@WebServlet(name = "AdminLoadOrdersServlet", value = "/AdminLoadOrdersServlet")
public class AdminLoadOrdersServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UUID userId = UUID.fromString(request.getParameter("userId"));
        TreeMap<UUID, User> users = (TreeMap<UUID, User>) request.getSession().getAttribute("users");
        User newUser = users.get(userId);
        request.getSession().setAttribute("newUser", newUser);
        request.getRequestDispatcher("WEB-INF/admin/customerOrders.jsp").forward(request, response);
    }
}
