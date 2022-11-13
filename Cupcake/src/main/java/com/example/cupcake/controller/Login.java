package com.example.cupcake.controller;

import com.example.cupcake.Mappers.UserMapper;
import com.example.cupcake.model.Basket;
import com.example.cupcake.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserMapper userMapper = new UserMapper();

        boolean validated = userMapper.validateUser(email, password);
        if (validated) {
            User user = new User(userMapper.getUserId(email), email, password, userMapper.getFirstName(email), userMapper.getLastName(email), new Basket(), userMapper.getRole(email), userMapper.getUserBalance(email));
            request.getSession().setAttribute("user", user);
            if (user.getRole().equals("admin")) {
                System.out.println("admin");
                request.getRequestDispatcher("WEB-INF/admin/homepage.jsp").forward(request, response);
            } else {
                System.out.println("customer");
                request.getRequestDispatcher("WEB-INF/homepage.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
