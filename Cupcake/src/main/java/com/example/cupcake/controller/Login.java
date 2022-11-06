package com.example.cupcake.controller;

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

        UserMapper mapper = new UserMapper();

        boolean validated = mapper.validateUser(email, password);
        if (validated) {
            User user = new User(email, password, mapper.getFirstName(email), mapper.getLastName(email), new Basket());
            request.getSession().setAttribute("user", user);
            request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
        } else {
            System.out.println("WRONG");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
