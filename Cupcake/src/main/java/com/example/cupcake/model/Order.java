package com.example.cupcake.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TreeMap;
import java.util.UUID;

public class Order {
    private UUID orderId;
    private User user;
    private String date;
    private int price;
    private String status;
    private TreeMap<UUID, Cupcake> cupcakes;

    public Order(User user, int price, TreeMap<UUID, Cupcake> cupcakes) {
        this.user = user;
        this.price = price;
        this.cupcakes = cupcakes;
        this.orderId = UUID.randomUUID();
        this.date = formatDate(new Date());
        this.status = "Modtaget";
    }

    public String formatDate(Date date) {
        SimpleDateFormat format = new SimpleDateFormat("d MMM yyyy");
        String newDate = format.format(date);
        return newDate;
    }

    public UUID getOrderId() {
        return orderId;
    }

    public void setOrderId(UUID orderId) {
        this.orderId = orderId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public TreeMap<UUID, Cupcake> getCupcakes() {
        return cupcakes;
    }

    public void setCupcakes(TreeMap<UUID, Cupcake> cupcakes) {
        this.cupcakes = cupcakes;
    }
}
