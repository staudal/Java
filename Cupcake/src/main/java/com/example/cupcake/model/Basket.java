package com.example.cupcake.model;

import java.util.TreeMap;
import java.util.UUID;

public class Basket {
    private TreeMap<UUID, Cupcake> cupcakes = new TreeMap<>();
    private int totalPrice;

    public TreeMap<UUID, Cupcake> getCupcakes() {
        return cupcakes;
    }

    public void setCupcakes(TreeMap<UUID, Cupcake> cupcakes) {
        this.cupcakes = cupcakes;
    }

    public int getSizeOfBasket() {
        return cupcakes.size();
    }

    public void addCupcakeToBasket(Cupcake cupcake) {
        this.cupcakes.put(cupcake.getId(), cupcake);
    }

    public void clearBasket() {
        cupcakes.clear();
    }

    public int getTotalPrice() {
        int price = 0;
        for (Cupcake cupcake : cupcakes.values()) {
            price += cupcake.getPrice();
        }
        return price;
    }

    public void removeCupcakeFromBasket(UUID id) {
        this.cupcakes.remove(id);
    }
}