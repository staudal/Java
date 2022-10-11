package com.example.todoapplication.model;

import com.example.todoapplication.database.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
    private String username;
    private String password;
    private TodoList todoList;

    public TodoList getTodoList() {
        return todoList;
    }

    public User(String username, String password, TodoList todoList) {
        this.username = username;
        this.password = password;
        this.todoList = todoList;
    }

    public boolean userExists(String username) {
        boolean exists = false;
        Connection connection = new Connection();
        String sql = "SELECT * FROM users";
        ResultSet set = null;
        try {
            set = connection.connect().createStatement().executeQuery(sql);
            while (set.next()) {
                if (set.getString("username").equals(username)) {
                    exists = true;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return exists;
    }

    public void createUser(String username, String password) {
        Connection connection = new Connection();
        String sql = "INSERT INTO users (username, password) VALUES ('" + username + "', '" + password + "')";
        PreparedStatement statement = null;
        try {
            statement = connection.connect().prepareStatement(sql);
            statement.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean correctPassword(String username, String password) {
        boolean correct = false;
        Connection connection = new Connection();
        String sql = "SELECT * FROM users";
        ResultSet set = null;
        try {
            set = connection.connect().createStatement().executeQuery(sql);
            while (set.next()) {
                if (set.getString("username").equals(username)) {
                    if (set.getString("password").equals(password)) {
                        correct = true;
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return correct;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }
}
