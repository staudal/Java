package com.example.bankapplication.model;

import com.example.bankapplication.database.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class User {
    private String username;
    private String password;

    public boolean userExists(String username) throws SQLException {
        boolean exists = false;
        Connection connection = new Connection();
        String sql = "SELECT * FROM users";
        ResultSet set = connection.connect().createStatement().executeQuery(sql);
        while (set.next()) {
            if (set.getString("username").equals(username)) {
                exists = true;
            }
        }
        return exists;
    }

    public void createUser(String username, String password) throws SQLException {
        Connection connection = new Connection();
        String sql = "INSERT INTO users (username, password) VALUES ('" + username + "', '" + password + "')";
        PreparedStatement statement = connection.connect().prepareStatement(sql);
        statement.execute();
    }

    public User getUser(String username) throws SQLException {
        User user = new User();
        Connection connection = new Connection();
        String sql = "SELECT * FROM users";

        if (userExists(username)) {
            ResultSet set = connection.connect().createStatement().executeQuery(sql);
            while (set.next()) {
                if (set.getString("username").equals(username)) {
                    user.setUsername(set.getString("username"));
                    user.setPassword(set.getString("password"));
                }
            }
            return user;
        } else {
            return null;
        }
    }

    public boolean correctPassword(String username, String password) throws SQLException {
        boolean correct = false;
        Connection connection = new Connection();
        String sql = "SELECT * FROM users";
        ResultSet set = connection.connect().createStatement().executeQuery(sql);
        while (set.next()) {
            if (set.getString("username").equals(username)) {
                if (set.getString("password").equals(password)) {
                    correct = true;
                }
            }
        }
        return correct;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
