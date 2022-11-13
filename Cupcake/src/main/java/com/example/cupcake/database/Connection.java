package com.example.cupcake.database;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connection {
    private final String USERNAME = "root";
    private final String PASSWORD = "root";
    private final String URL = "jdbc:mysql://localhost:3306/cupcakes";

    private java.sql.Connection connect;

    public java.sql.Connection connect() {
        if (connect == null) {
            try {
                connect = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return connect;
    }
}
