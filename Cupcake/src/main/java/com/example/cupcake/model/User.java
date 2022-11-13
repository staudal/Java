package com.example.cupcake.model;

import java.util.ArrayList;
import java.util.UUID;

public class User {
    private UUID id;
    private String email;
    private String password;
    private Basket basket;
    private String firstName;
    private String lastName;
    private String role;
    private int balance;
    private ArrayList<Order> orders;

    public ArrayList<Order> getOrders() {
        return orders;
    }

    public void setOrders(ArrayList<Order> orders) {
        this.orders = orders;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    public Basket getBasket() {
        return basket;
    }

    public void setBasket(Basket basket) {
        this.basket = basket;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    // creating an account
    public User(String email, String password, String firstName, String lastName, Basket basket, String role) {
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.basket = basket;
        this.id = UUID.randomUUID();
        this.role = role;
        this.balance = 0;
    }

    // logging in
    public User(UUID id, String email, String password, String firstName, String lastName, Basket basket, String role, int userBalance) {
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.basket = basket;
        this.id = id;
        this.role = role;
        this.balance = userBalance;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
