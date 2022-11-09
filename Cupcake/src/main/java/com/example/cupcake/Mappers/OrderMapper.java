package com.example.cupcake.Mappers;

import com.example.cupcake.database.Connection;
import com.example.cupcake.model.Order;

import java.sql.SQLException;

public class OrderMapper {
    Connection connection = new Connection();
// orderId, userId, created_at, price, status
    public void insertOrderIntoDatabase(Order order) {
        String sql = "INSERT INTO orders (orderId, userId, created_at, price, status) VALUES ('"+order.getOrderId()+"', '"+order.getUser().getId()+"', '"+order.getDate()+"', '"+order.getPrice()+"', '"+order.getStatus()+"')";
        try {
            connection.connect().createStatement().executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
