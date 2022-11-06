package com.example.servlettemplate.Mappers;

import com.example.servlettemplate.database.Connection;
import com.example.servlettemplate.model.User;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper {
    Connection connection = new Connection();

    public void addUserToDatabase(User user) {
        String sql = "INSERT INTO users (id, email, password) VALUES ('" + user.getId() + "', '" + user.getEmail() + "', '" + user.getPassword() + "')";
        try {
            connection.connect().createStatement().executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean validateUser(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = '" + email + "'";
        try {
            ResultSet set = connection.connect().createStatement().executeQuery(sql);
            while (set.next()) {
                if (password.equals(set.getString("password"))) {
                    return true;
                }
            }
            return false;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
