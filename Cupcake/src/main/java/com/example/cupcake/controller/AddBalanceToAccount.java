package com.example.cupcake.controller;

import com.example.cupcake.Mappers.UserMapper;
import com.example.cupcake.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AddBalanceToAccount", value = "/AddBalanceToAccount")
public class AddBalanceToAccount extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        int amount = Integer.parseInt(request.getParameter("amount"));
        UserMapper mapper = new UserMapper();
        mapper.addToUserBalance(user.getEmail(), amount);
        user.setBalance(mapper.getUserBalance(user.getEmail()));
        request.getRequestDispatcher("WEB-INF/account.jsp").forward(request, response);
    }
}
