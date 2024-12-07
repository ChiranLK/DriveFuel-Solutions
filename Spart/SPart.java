package com.DFSolutions.Spart;

import java.util.ArrayList;
import java.util.List;

public class SPart {
    private int id;
    private String name;
	private String type;
	private Double price;
    private static List<SPart> users = new ArrayList<>();
    private static int count = 0;
    
    public SPart() {}
    public SPart(String name, String type, Double price) {
    	this.id = ++count;
        this.name = name;
        this.type = type;
        this.price = price;
        users.add(this);
    }

    public SPart(int id, String name, String type, Double price) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.price = price;
        users.add(this);
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
		return type;
	}
    
	public void setType(String type) {
		this.type = type;
	}
	
	public Double getPrice() {
		return price;
	}
	
	public void setPrice(Double price) {
		this.price = price;
	}
}

