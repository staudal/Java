package com.example.cupcake.model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class Order {
    private UUID id;
    private String topping;
    private String bottom;
    private User user;
    private int price;
    private String paid;
    private String date;

    public Order(String topping, String bottom, User user, int price, String paid) {
        this.topping = topping;
        this.bottom = bottom;
        this.user = user;
        this.price = price;
        this.paid = paid;
        this.date = formatDate(new Date());
        this.id = UUID.randomUUID();
    }

    public Order(UUID id, String topping, String bottom, User user, int price, String paid, String date) {
        this.topping = topping;
        this.bottom = bottom;
        this.user = user;
        this.price = price;
        this.paid = paid;
        this.id = id;
        this.date = date;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getTopping() {
        return topping;
    }

    public void setTopping(String topping) {
        this.topping = topping;
    }

    public String getBottom() {
        return bottom;
    }

    public void setBottom(String bottom) {
        this.bottom = bottom;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getPaid() {
        return paid;
    }

    public void setPaid(String paid) {
        this.paid = paid;
    }

    public String formatDate(Date date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("W. MMM yyyy '('hh:mm')'");
        return dateFormat.format(date);
    }

    public String getDate() {
        return date;
    }
}
