package com.example.servlettemplate.model;

import java.util.Map;
import java.util.TreeMap;

public class Bottom {
    private Map<String, Integer> bottoms = new TreeMap<>();

    public Map<String, Integer> populateBottoms() {
        bottoms.put("chokolade", 5);
        bottoms.put("vanilje", 5);
        bottoms.put("muskatnød", 5);
        bottoms.put("pistacie", 6);
        bottoms.put("mandel",7);
        return bottoms;
    }
}
