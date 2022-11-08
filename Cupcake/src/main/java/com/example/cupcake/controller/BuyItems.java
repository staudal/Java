package com.example.cupcake.controller;

import com.example.cupcake.Mappers.OrderMapper;
import com.example.cupcake.model.Cupcake;
import com.example.cupcake.model.Order;
import com.example.cupcake.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "BuyItems", value = "/BuyItems")
public class BuyItems extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        ArrayList<Order> orders = new ArrayList<>();

        for (Cupcake cupcake : user.getBasket().getCupcakes().values()) {
            int price = cupcake.getCupcakePrice();
            orders.add(new Order(cupcake.getToppingName(), cupcake.getBottomName(), user, price, "Yes"));
        }

        OrderMapper mapper = new OrderMapper();
        for (Order order : orders) {
            mapper.addNewOrderToDatabase(order);
        }

        user.getBasket().clearBasket();
        request.getSession().setAttribute("orders", mapper.getOrders(user));
        request.getSession().setAttribute("user", user);
        request.getRequestDispatcher("WEB-INF/orders.jsp").forward(request, response);
    }
}
