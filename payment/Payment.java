package com.DFSolutions.payment;

public class Payment {
    private int id;
    private String email;
    private String amount;
    private String status;
    private String paymentMethod;
    private String paymentDate;
    
	public Payment(int id, String email, String amount, String status, String paymentMethod, String paymentDate) {
		super();
		this.id = id;
		this.email = email;
		this.amount = amount;
		this.status = status;
		this.paymentMethod = paymentMethod;
		this.paymentDate = paymentDate;
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

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}
  
}
