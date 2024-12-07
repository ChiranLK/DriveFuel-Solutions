package com.DFSolutions.user;

public class User {
	
    private String email;
    private String fname;
    private String lname;
	private String hash;
    private String type;
    private String mobile;
    private String address;
    
	public User(String email, String fname, String lname, String hash, String type, String mobile, String address) {
		super();
		this.email = email;
		this.fname = fname;
		this.lname = lname;
		this.hash = hash;
		this.type = type;
		this.mobile = mobile;
		this.address = address;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getFname() {
		return fname;
	}
	
	public void setFname(String fname) {
		this.fname = fname;
	}
	
	public String getLname() {
		return lname;
	}
	
	public void setLname(String lname) {
		this.lname = lname;
	}
	
	public String getHash() {
		return hash;
	}
	
	public void setHash(String hash) {
		this.hash = hash;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getMobile() {
		return mobile;
	}
	
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
}
