package com.example.servlettemplate.model;

import java.util.Map;
import java.util.UUID;

public class Cupcake {
    private String toppingName;
    private String bottomName;
    private UUID id;
    private int toppingPrice;
    private int bottomPrice;

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public Cupcake(String toppingName, String bottomName) {
        Map<String, Integer> toppings = new Topping().populateToppings();
        Map<String, Integer> bottoms = new Bottom().populateBottoms();
        this.toppingName = toppingName;
        this.bottomPrice = toppings.get(toppingName);
        this.bottomName = bottomName;
        this.bottomPrice = bottoms.get(bottomName);
        this.id = UUID.randomUUID();
    }

    public String getToppingName() {
        return toppingName;
    }

    public void setToppingName(String toppingName) {
        this.toppingName = toppingName;
    }

    public String getBottomName() {
        return bottomName;
    }

    public void setBottomName(String bottomName) {
        this.bottomName = bottomName;
    }

    public int getToppingPrice() {
        return toppingPrice;
    }

    public void setToppingPrice(int toppingPrice) {
        this.toppingPrice = toppingPrice;
    }

    public int getBottomPrice() {
        return bottomPrice;
    }

    public void setBottomPrice(int bottomPrice) {
        this.bottomPrice = bottomPrice;
    }
}
