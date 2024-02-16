package com.shopping.model.bean;

public class MyLike {
	private String PRONM;
	private String MBRID;
	private String LKEDT;
	private String PROIMG;
	private int PROPR;
	
	
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
	public String getPROIMG() {
		return PROIMG;
	}
	public void setPROIMG(String pROIMG) {
		PROIMG = pROIMG;
	}
	public int getPROPR() {
		return PROPR;
	}
	public void setPROPR(int pROPR) {
		PROPR = pROPR;
	}
	
	public MyLike(String pRONM, String mBRID, String lKEDT, String pROIMG, int pROPR) {
		super();
		PRONM = pRONM;
		MBRID = mBRID;
		LKEDT = lKEDT;
		PROIMG = pROIMG;
		PROPR = pROPR;
	}
	
	public MyLike() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "MyLike [PRONM=" + PRONM + ", MBRID=" + MBRID + ", LKEDT=" + LKEDT + ", PROIMG=" + PROIMG + ", PROPR="
				+ PROPR + "]";
	}
	
	
	
}
