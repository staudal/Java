package com.example.cupcake.model;

import java.util.ArrayList;
import java.util.TreeMap;
import java.util.UUID;

public class Basket {
    private ArrayList<Cupcake> cupcakes = new ArrayList<>();
    private int totalPrice;

    public ArrayList<Cupcake> getCupcakes() {
        return cupcakes;
    }

    public void setCupcakes(ArrayList<Cupcake> cupcakes) {
        this.cupcakes = cupcakes;
    }

    public int getSizeOfBasket() {
        return cupcakes.size();
    }

    public void addCupcakeToBasket(Cupcake cupcake) {
        this.cupcakes.add(cupcake);
    }

    public void clearBasket() {
        cupcakes.clear();
    }

    public int getTotalPrice() {
        int price = 0;
        for (Cupcake cupcake : cupcakes) {
            price += cupcake.getPrice();
        }
        return price;
    }
}