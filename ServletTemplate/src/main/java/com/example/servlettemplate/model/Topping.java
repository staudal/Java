package com.example.servlettemplate.model;

import java.util.Map;
import java.util.TreeMap;

public class Topping {
    private Map<String, Integer> toppings = new TreeMap<>();

    public Map<String, Integer> populateToppings() {
        toppings.put("chokolade", 5);
        toppings.put("blåbær", 5);
        toppings.put("hindbær", 5);
        toppings.put("jordbær", 6);
        toppings.put("rosin",7);
        toppings.put("appelsin", 8);
        toppings.put("citron", 8);
        toppings.put("blå ost", 9);
        return toppings;
    }
}
