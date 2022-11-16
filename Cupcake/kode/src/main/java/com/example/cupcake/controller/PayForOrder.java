package com.example.cupcake.controller;

import com.example.cupcake.Mappers.CakeMapper;
import com.example.cupcake.Mappers.OrderMapper;
import com.example.cupcake.Mappers.UserMapper;
import com.example.cupcake.model.Order;
import com.example.cupcake.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.TreeMap;
import java.util.UUID;

@WebServlet(name = "PayForOrder", value = "/PayForOrder")
public class PayForOrder extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        Order order = new Order(user, user.getBasket().getTotalPrice() + 5, user.getBasket().getCupcakes());
        UserMapper userMapper = new UserMapper();
        System.out.println(userMapper.getUserBalance(user.getEmail()));

        if (order.getPrice() > userMapper.getUserBalance(user.getEmail())) {
            request.getRequestDispatcher("WEB-INF/account.jsp").forward(request, response);
        } else {
            OrderMapper orderMapper = new OrderMapper();
            CakeMapper cakeMapper = new CakeMapper();

            userMapper.subtractFromUserBalance(user.getEmail(), order.getPrice());
            user.setBalance(userMapper.getUserBalance(user.getEmail()));

            orderMapper.insertOrderIntoDatabase(order);
            cakeMapper.addCakesToDatabase(order);

            ArrayList<Order> orders = orderMapper.getAllOrdersForUser(user);

            user.getBasket().clearBasket();
            request.getSession().setAttribute("orders", orders);
            request.getRequestDispatcher("WEB-INF/orders.jsp").forward(request, response);
        }
    }
}