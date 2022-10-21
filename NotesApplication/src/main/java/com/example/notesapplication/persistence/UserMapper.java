package com.example.notesapplication.persistence;

import com.example.notesapplication.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper {
    DatabaseConnection connection = new DatabaseConnection();

    public void add(User user) {
        String command = "INSERT INTO users (username, password) VALUES (?, ?)";

        try {
            PreparedStatement statement = connection.connect().prepareStatement(command);
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public boolean usernameAlreadyUsed(String username) {
        boolean usernameExists = false;
        String command = "SELECT * FROM users";

        try {
            PreparedStatement statement = connection.connect().prepareStatement(command);
            ResultSet set = statement.executeQuery();
            while (set.next()) {
                if (set.getString("username").equals(username)) {
                    usernameExists = true;
                }
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return usernameExists;
    }

    public boolean isVerified(User user) {
        boolean verified = false;
        String command = "SELECT * FROM users";

        try {
            PreparedStatement statement = connection.connect().prepareStatement(command);
            ResultSet set = statement.executeQuery();
            while (set.next()) {
                if (set.getString("username").equals(user.getUsername()) && set.getString("password").equals(user.getPassword())) {
                    verified = true;
                }
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return verified;
    }
}
