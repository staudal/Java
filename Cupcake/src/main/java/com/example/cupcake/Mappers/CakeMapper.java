package com.example.cupcake.Mappers;

import com.example.cupcake.database.Connection;
import com.example.cupcake.model.Cupcake;
import com.example.cupcake.model.Order;

import java.sql.SQLException;

public class CakeMapper {
    Connection connection = new Connection();

    public void addCakesToDatabase(Order order) {
        for (Cupcake cupcake : order.getCupcakes().values()) {
            String sql = "INSERT INTO cakes (cakeId, orderId, bottom, topping) VALUES ('"+cupcake.getId()+"', '"+order.getOrderId()+"', '"+cupcake.getBottom().getName()+"', '"+cupcake.getTopping().getName()+"')";
            try {
                connection.connect().createStatement().executeUpdate(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}