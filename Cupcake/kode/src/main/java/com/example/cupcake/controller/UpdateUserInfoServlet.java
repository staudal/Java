package com.example.cupcake.controller;

import com.example.cupcake.Mappers.UserMapper;
import com.example.cupcake.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "UpdateUserInfoServlet", value = "/UpdateUserInfoServlet")
public class UpdateUserInfoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPassword(password);

        UserMapper userMapper = new UserMapper();
        userMapper.updateUserInfo(user);

        request.getSession().setAttribute("user", user);
        request.getRequestDispatcher("WEB-INF/account.jsp").forward(request, response);
    }
}
