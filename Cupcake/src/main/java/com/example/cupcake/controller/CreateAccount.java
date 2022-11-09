package com.example.cupcake.controller;

import com.example.cupcake.Mappers.UserMapper;
import com.example.cupcake.model.Basket;
import com.example.cupcake.model.User;
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
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        User user = new User(email, password, firstName, lastName, new Basket(), "customer");

        UserMapper mapper = new UserMapper();
        mapper.addUserToDatabase(user);

        request.getSession().setAttribute("user", user);
        request.getRequestDispatcher("WEB-INF/stepOne.jsp").forward(request, response);
    }
}
