package com.example.cupcake.Mappers;

import com.example.cupcake.database.Connection;
import com.example.cupcake.model.Order;
import com.example.cupcake.model.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.TreeMap;
import java.util.UUID;

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

    public TreeMap<UUID, Order> getAllOrdersForUser(User user) {
        CakeMapper cakeMapper = new CakeMapper();
        TreeMap<UUID, Order> orders = new TreeMap<>();
        String sql = "SELECT * FROM orders WHERE userId = '"+user.getId()+"'";
        try {
            ResultSet set = connection.connect().createStatement().executeQuery(sql);
            while (set.next()) {
                orders.put(UUID.fromString(set.getString("orderId")), new Order(user, set.getInt("price"), cakeMapper.getAllCupcakesForOrder(UUID.fromString(set.getString("orderId")))));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
}
