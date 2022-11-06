package com.example.cupcake.Mappers;

import com.example.cupcake.database.Connection;
import com.example.cupcake.model.User;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper {
    Connection connection = new Connection();

    public void addUserToDatabase(User user) {
        String sql = "INSERT INTO users (id, email, password, firstName, lastName) VALUES ('" + user.getId() + "', '" + user.getEmail() + "', '" + user.getPassword() + "', '" + user.getFirstName() +"', '" + user.getLastName() +"')";
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

    public String getFirstName(String email) {
        String firstName = "";
        String sql = "SELECT * FROM users WHERE email = '" + email + "'";
        try {
            ResultSet set = connection.connect().createStatement().executeQuery(sql);
            while (set.next()) {
                firstName = set.getString("firstName");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return firstName;
    }

    public String getLastName(String email) {
        String lastName = "";
        String sql = "SELECT * FROM users WHERE email = '" + email + "'";
        try {
            ResultSet set = connection.connect().createStatement().executeQuery(sql);
            while (set.next()) {
                lastName = set.getString("firstName");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lastName;
    }
}
