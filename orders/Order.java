package com.DFSolutions.orders;


public class Order {
    private String email;
	private String unitprice;
    private String item;
    private String quantity;
    private String totalprice;
    private String status;
    private String type;
    private int id;
    
    public Order(String id, String email, String unitprice, String item, String quantity, String totalprice, String status, String type) {
		this.id = Integer.valueOf(id);
		this.email = email;
		this.unitprice = unitprice;
		this.item = item;
		this.quantity = quantity;
		this.totalprice = totalprice;
		this.status = status;
		this.type = type;
	}
    
    public Order(int id, String email, String unitprice, String item, String quantity, String totalprice, String status,  String type) {
    	this.id = id;
		this.email = email;
		this.unitprice = unitprice;
		this.item = item;
		this.quantity = quantity;
		this.totalprice = totalprice;
		this.status = status;
		this.type = type;
		this.id = id;
	}
    
    public String getType() {
		return type;
    }
    
    public void setType(String type) {
    	type = this.type;
    }
    
    public int getId() {
    	return id;        
    }

	public void setId(int id) {
		this.id = id;
	}
    
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUnitprice() {
		return unitprice;
	}

	public void setUnitprice(String unitprice) {
		this.unitprice = unitprice;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getTotalprice() {
		
		return totalprice= String.valueOf(Double.valueOf(quantity)*Double.valueOf(unitprice));
	}

	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public void setId(String id) {
		this.id = Integer.valueOf(id);
	}
	
	public int getID() {
		return id;
	}
    
    
}
