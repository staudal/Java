package com.example.cupcake.Mappers;

import com.example.cupcake.database.Connection;
import com.example.cupcake.model.Bottom;
import com.example.cupcake.model.Cupcake;
import com.example.cupcake.model.Order;
import com.example.cupcake.model.Topping;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.TreeMap;
import java.util.UUID;

public class CakeMapper {
    Connection connection = new Connection();

    public void addCakesToDatabase(Order order) {
        for (Cupcake cupcake : order.getCupcakes().values()) {
            String sql = "INSERT INTO cakes (cakeId, orderId, bottomName, toppingName, bottomPrice, toppingPrice) VALUES ('"+cupcake.getId()+"', '"+order.getOrderId()+"', '"+cupcake.getBottom().getName()+"', '"+cupcake.getTopping().getName()+"', '"+cupcake.getBottom().getPrice()+"', '"+cupcake.getTopping().getPrice()+"')";
            try {
                connection.connect().createStatement().executeUpdate(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public TreeMap<UUID, Cupcake> getAllCupcakesForOrder(UUID id) {
        TreeMap<UUID, Cupcake> cupcakes = new TreeMap<>();
        String sql = "SELECT * FROM cakes WHERE orderId = '" +id + "'";
        try {
            ResultSet set = connection.connect().createStatement().executeQuery(sql);
            while (set.next()) {
                cupcakes.put(UUID.fromString(set.getString("cakeId")), new Cupcake(new Bottom(set.getString("bottomName"), set.getInt("bottomPrice")), new Topping(set.getString("toppingName"), set.getInt("toppingPrice"))));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cupcakes;
    }
}