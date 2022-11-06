package com.example.cupcake.controller;

import com.example.cupcake.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "RemoveOrder", value = "/RemoveOrder")
public class RemoveOrder extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        UUID key = UUID.fromString(request.getParameter("cupcake"));
        System.out.println(user.getBasket().getSizeOfBasket());
        user.getBasket().getCupcakes().remove(key);
        System.out.println(user.getBasket().getSizeOfBasket());

        request.getSession().setAttribute("user", user);
        request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
    }
}
