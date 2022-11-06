package com.example.servlettemplate.controller;

import com.example.servlettemplate.Mappers.UserMapper;
import com.example.servlettemplate.model.Basket;
import com.example.servlettemplate.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "CreateAccount", value = "/CreateAccount")
public class CreateAccount extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = new User(email, password, new Basket());

        UserMapper mapper = new UserMapper();
        mapper.addUserToDatabase(user);

        request.getSession().setAttribute("email", email);
        request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
    }
}
