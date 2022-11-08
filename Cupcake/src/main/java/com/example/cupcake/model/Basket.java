package com.example.cupcake.model;

import java.util.Map;
import java.util.TreeMap;
import java.util.UUID;

public class Basket {
    private Map<UUID, Cupcake> cupcakes = new TreeMap<>();
    private int totalPrice;

    public Map<UUID, Cupcake> getCupcakes() {
        return cupcakes;
    }

    public void setCupcakes(Map<UUID, Cupcake> cupcakes) {
        this.cupcakes = cupcakes;
    }

    public int getSizeOfBasket() {
        return cupcakes.size();
    }

    public void addCupcakeToBasket(Cupcake cupcake, int amount) {
        for (int i = 0; i < amount; i++) {
            this.cupcakes.put(UUID.randomUUID(), cupcake);
        }
    }

    public void clearBasket() {
        cupcakes.clear();
    }

    public int getTotalPrice() {
        int price = 0;
        for (Cupcake cupcake : cupcakes.values()) {
            price += cupcake.getToppingPrice();
            price += cupcake.getBottomPrice();
        }
        return price;
    }

    public void removeCupcakeFromBasket(Cupcake cupcake) {
        getCupcakes().remove(cupcake.getId());
    }
}