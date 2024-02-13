package com.shopping.model.bean;

public class Like {
	private String PRONM;
	private String MBRID;
	private String LKEDT;
	
	public Like() {
		// TODO Auto-generated constructor stub
	}
	
	public Like(String pRONM, String mBRID, String lKEDT) {
		super();
		PRONM = pRONM;
		MBRID = mBRID;
		LKEDT = lKEDT;
	}
	
	@Override
	public String toString() {
		return "Like [PRONM=" + PRONM + ", MBRID=" + MBRID + ", LKEDT=" + LKEDT + "]";
	}
	
	public String getPRONM() {
		return PRONM;
	}
	public void setPRONM(String pRONM) {
		PRONM = pRONM;
	}
	public String getMBRID() {
		return MBRID;
	}
	public void setMBRID(String mBRID) {
		MBRID = mBRID;
	}
	public String getLKEDT() {
		return LKEDT;
	}
	public void setLKEDT(String lKEDT) {
		LKEDT = lKEDT;
	}
	
	
}
