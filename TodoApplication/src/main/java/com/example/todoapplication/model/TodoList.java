package com.example.todoapplication.model;

import com.example.todoapplication.database.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class TodoList {
    private Map<Integer, String> todoList = new TreeMap<>();
    private int todoCount;

    public int getTodoCount() {
        return todoCount;
    }

    public void setTodoList(Map<Integer, String> todoList) {
        this.todoList = todoList;
    }

    public Map<Integer, String> getTodoList() {
        return todoList;
    }

    public void initializeTodoList(TodoList todoList, String username) {
        Connection connection = new Connection();
        String sql = "SELECT * FROM todos WHERE user='" + username + "'";
        try {
            ResultSet set = connection.connect().createStatement().executeQuery(sql);
            while (set.next()) {
                todoList.getTodoList().put(Integer.valueOf(set.getString("id")), set.getString("name"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void syncTodoList(User user) {
        TodoList todoList = new TodoList();
        Connection connection = new Connection();
        String sql = "SELECT * FROM todos WHERE user='" + user.getUsername() + "'";
        try {
            ResultSet set = connection.connect().createStatement().executeQuery(sql);
            while (set.next()) {
                todoList.getTodoList().put(Integer.valueOf(set.getString("id")), set.getString("name"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        user.getTodoList().setTodoList(todoList.getTodoList());
        todoCount = user.getTodoList().getTodoList().size();
    }

    public void insertNewTodo(String todoItem, User user) {
        Connection connection = new Connection();
        String sql = "INSERT INTO todos (name, user) VALUES ('" + todoItem + "', '" + user.getUsername() + "')";
        try {
            connection.connect().createStatement().executeUpdate(sql);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        syncTodoList(user);
    }

    public void removeTodoItem(Integer id, User user) {
        Connection connection = new Connection();
        String sql = "DELETE FROM todos WHERE id='" + id + "'";
        try {
            connection.connect().createStatement().executeUpdate(sql);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        syncTodoList(user);
    }

    public void changeTodoItem(Integer id, String updatedValue, User user) {
        Connection connection = new Connection();
        String sql = "UPDATE todos SET name = '" + updatedValue + "' WHERE id = '" + id + "'";
        try {
            connection.connect().createStatement().executeUpdate(sql);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        syncTodoList(user);
    }

    public void removeAllTodos(User user) {
        Connection connection = new Connection();
        String sql = "DELETE FROM todos WHERE user = '" + user.getUsername() + "'";
        try {
            connection.connect().createStatement().executeUpdate(sql);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        syncTodoList(user);
    }
}
