package com.example.cupcake.controller;

import com.example.cupcake.Mappers.OrderMapper;
import com.example.cupcake.Mappers.UserMapper;
import com.example.cupcake.model.Basket;
import com.example.cupcake.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserMapper userMapper = new UserMapper();
        OrderMapper orderMapper = new OrderMapper();

        boolean validated = userMapper.validateUser(email, password);
        if (validated) {
            User user = new User(userMapper.getUserId(email), email, password, userMapper.getFirstName(email), userMapper.getLastName(email), new Basket(), "customer", userMapper.getUserBalance(email));
            request.getSession().setAttribute("user", user);
            request.getRequestDispatcher("WEB-INF/homepage.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
