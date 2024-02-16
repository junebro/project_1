package com.shopping.model.bean;

public class Order {
	private String ORDCD;
	private String ORDDT;
	private String MBRID;
	private String PROCD;
	private int ORDQTY;
	private int ORDSZ;
	private int TOTPR;
	
	
	public Order() {
		// TODO Auto-generated constructor stub
	}
	
	public String getORDCD() {
		return ORDCD;
	}
	public void setORDCD(String oRDCD) {
		ORDCD = oRDCD;
	}
	public String getORDDT() {
		return ORDDT;
	}
	public void setORDDT(String oRDDT) {
		ORDDT = oRDDT;
	}
	public String getMBRID() {
		return MBRID;
	}
	public void setMBRID(String mBRID) {
		MBRID = mBRID;
	}
	public String getPROCD() {
		return PROCD;
	}
	public void setPROCD(String pROCD) {
		PROCD = pROCD;
	}
	public int getORDQTY() {
		return ORDQTY;
	}
	public void setORDQTY(int oRDQTY) {
		ORDQTY = oRDQTY;
	}
	public int getORDSZ() {
		return ORDSZ;
	}
	public void setORDSZ(int oRDSZ) {
		ORDSZ = oRDSZ;
	}
	public int getTOTPR() {
		return TOTPR;
	}
	public void setTOTPR(int tOTPR) {
		TOTPR = tOTPR;
	}

	

}
