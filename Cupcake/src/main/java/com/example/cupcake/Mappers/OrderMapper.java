package com.example.cupcake.Mappers;

import com.example.cupcake.database.Connection;
import com.example.cupcake.model.Order;
import com.example.cupcake.model.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.UUID;

public class OrderMapper {
    Connection connection = new Connection();

    public void addNewOrderToDatabase(Order order) {
        String sql = "INSERT INTO orders (id, topping, bottom, user, price, paid, date) VALUES ('" + order.getId() + "', '" + order.getTopping() + "', '" + order.getBottom() + "', '" + order.getUser().getId() + "', '" + order.getPrice() + "', '" + order.getPaid() + "', '" + order.getDate() + "')";
        try {
            connection.connect().createStatement().executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Order> getOrders(User user) {
        ArrayList<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE user = '" + user.getId() + "'";
        try {
            ResultSet set = connection.connect().createStatement().executeQuery(sql);
            while (set.next()) {
                orders.add(new Order(UUID.fromString(set.getString("id")), set.getString("topping"), set.getString("bottom"), user, set.getInt("price"), set.getString("paid"), set.getString("date")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
}
