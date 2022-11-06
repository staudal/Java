package com.example.servlettemplate.model;

import java.util.UUID;

public class User {
    private UUID id;
    private String email;
    private String password;
    private Basket basket;

    public Basket getBasket() {
        return basket;
    }

    public void setBasket(Basket basket) {
        this.basket = basket;
    }

    public User(String email, String password, Basket basket) {
        this.email = email;
        this.password = password;
        this.basket = basket;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
        this.id = UUID.randomUUID();
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
