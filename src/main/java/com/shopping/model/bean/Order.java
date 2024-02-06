package com.shopping.model.bean;

public class Order {
	private String ordcd;
	private String mbrcd;
	private String ordtp;
	private String orddt;
	
	public Order() {
		// TODO Auto-generated constructor stub
	}
	
	public Order(String ordcd, String mbrcd, String ordtp, String orddt) {
		super();
		this.ordcd = ordcd;
		this.mbrcd = mbrcd;
		this.ordtp = ordtp;
		this.orddt = orddt;
	}
	
	public String getOrdcd() {
		return ordcd;
	}
	public void setOrdcd(String ordcd) {
		this.ordcd = ordcd;
	}
	public String getMbrcd() {
		return mbrcd;
	}
	public void setMbrcd(String mbrcd) {
		this.mbrcd = mbrcd;
	}
	public String getOrdtp() {
		return ordtp;
	}
	public void setOrdtp(String ordtp) {
		this.ordtp = ordtp;
	}
	public String getOrddt() {
		return orddt;
	}
	public void setOrddt(String orddt) {
		this.orddt = orddt;
	}
	
}
