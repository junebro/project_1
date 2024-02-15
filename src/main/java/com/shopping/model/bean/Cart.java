package com.shopping.model.bean;

public class Cart {
	String PROCD;
	int QTY;
	String MBRID;
	int PROSZ;
	
	public Cart() {
		// TODO Auto-generated constructor stub
	}

	
	
	
	public String getPROCD() {
		return PROCD;
	}




	public void setPROCD(String pROCD) {
		PROCD = pROCD;
	}




	public int getQTY() {
		return QTY;
	}




	public void setQTY(int qTY) {
		QTY = qTY;
	}




	public String getMBRID() {
		return MBRID;
	}




	public void setMBRID(String mBRID) {
		MBRID = mBRID;
	}




	public int getPROSZ() {
		return PROSZ;
	}




	public void setPROSZ(int pROSZ) {
		PROSZ = pROSZ;
	}




	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	
	
}
