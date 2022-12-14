package com.example.cupcake.Mappers;

import com.example.cupcake.database.Connection;
import com.example.cupcake.model.Basket;
import com.example.cupcake.model.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.TreeMap;
import java.util.UUID;

public class UserMapper {
    Connection connection = new Connection();

    public void addUserToDatabase(User user) {
// USER SCHEMA: userId (varchar), role (varchar), firstName (varchar), lastName (varchar), email (varchar), password (varchar)
        String sql = "INSERT INTO users (userId, role, firstName, lastName, email, password, balance) VALUES ('"+user.getId()+"', '"+"customer"+"', '"+user.getFirstName()+"', '"+user.getLastName()+"', '"+user.getEmail()+"', '"+user.getPassword()+"', '"+user.getBalance()+"')";
        try {
            connection.connect().createStatement().executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUserInfo(User user) {
        String sql = "UPDATE users SET firstName = '" + user.getFirstName() + "', lastName = '" + user.getLastName() + "', email = '" + user.getEmail() + "', password = '" + user.getPassword() + "' WHERE userId = '" + user.getId() + "'";
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

    public UUID getUserId(String email) {
        String id = "";
        String sql = "SELECT * FROM users WHERE email = '" + email + "'";
        try {
            ResultSet set = connection.connect().createStatement().executeQuery(sql);
            while (set.next()) {
                id = set.getString("userId");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return UUID.fromString(id);
    }

    public int getUserBalance(String email) {
        int balance = 0;
        String sql = "SELECT * FROM users WHERE email = '" + email + "'";
        try {
            ResultSet set = connection.connect().createStatement().executeQuery(sql);
            while (set.next()) {
                balance = set.getInt("balance");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return balance;
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
                lastName = set.getString("lastName");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lastName;
    }

    public String getRole(String email) {
        String role = "";
        String sql = "SELECT * FROM users WHERE email = '" + email + "'";
        try {
            ResultSet set = connection.connect().createStatement().executeQuery(sql);
            while (set.next()) {
                role = set.getString("role");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return role;
    }

    public int addToUserBalance(String email, int amount) {
        int balance = getUserBalance(email);
        String sql = "UPDATE users SET balance = '" + (balance + amount) + "' WHERE email = '" + email + "'";
        try {
            connection.connect().createStatement().executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return balance;
    }

    public int subtractFromUserBalance(String email, int amount) {
        int balance = getUserBalance(email);
        String sql = "UPDATE users SET balance = '" + (balance - amount) + "' WHERE email = '" + email + "'";
        try {
            connection.connect().createStatement().executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return balance;
    }

    public TreeMap<UUID, User> getAllUsers() {
        TreeMap<UUID, User> users = new TreeMap<>();
        String sql = "SELECT * FROM users";
        try {
            ResultSet set = connection.connect().createStatement().executeQuery(sql);
            while (set.next()) {
                users.put(UUID.fromString(set.getString("userId")), new User(UUID.fromString(set.getString("userId")), set.getString("email"), set.getString("password"), set.getString("firstName"), set.getString("lastName"), new Basket(), set.getString("role"), set.getInt("balance")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
}
