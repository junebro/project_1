package com.shopping.model.bean;

public class MyOrder {
	private String MBRID;
	private String ORDDT;
	private String PROIMG;
	private String PRONM;
	private String PROCR;	
	private int ORDSZ;
	private int ORDQTY;
	private int TOTPR;
	
	public String getMBRID() {
		return MBRID;
	}
	public void setMBRID(String mBRID) {
		MBRID = mBRID;
	}
	public String getORDDT() {
		return ORDDT;
	}
	public void setORDDT(String oRDDT) {
		ORDDT = oRDDT;
	}
	public String getPROIMG() {
		return PROIMG;
	}
	public void setPROIMG(String pROIMG) {
		PROIMG = pROIMG;
	}
	public String getPRONM() {
		return PRONM;
	}
	public void setPRONM(String pRONM) {
		PRONM = pRONM;
	}
	public String getPROCR() {
		return PROCR;
	}
	public void setPROCR(String pROCR) {
		PROCR = pROCR;
	}
	public int getORDSZ() {
		return ORDSZ;
	}
	public void setORDSZ(int oRDSZ) {
		ORDSZ = oRDSZ;
	}
	public int getORDQTY() {
		return ORDQTY;
	}
	public void setORDQTY(int oRDQTY) {
		ORDQTY = oRDQTY;
	}
	public int getTOTPR() {
		return TOTPR;
	}
	public void setTOTPR(int tOTPR) {
		TOTPR = tOTPR;
	}
	
	public MyOrder(String mBRID, String oRDDT, String pROIMG, String pRONM, String pROCR, int oRDSZ, int oRDQTY,
			int tOTPR) {
		super();
		MBRID = mBRID;
		ORDDT = oRDDT;
		PROIMG = pROIMG;
		PRONM = pRONM;
		PROCR = pROCR;
		ORDSZ = oRDSZ;
		ORDQTY = oRDQTY;
		TOTPR = tOTPR;
	}
	
	public MyOrder() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "MyOrder [MBRID=" + MBRID + ", ORDDT=" + ORDDT + ", PROIMG=" + PROIMG + ", PRONM=" + PRONM + ", PROCR="
				+ PROCR + ", ORDSZ=" + ORDSZ + ", ORDQTY=" + ORDQTY + ", TOTPR=" + TOTPR + "]";
	}
	
	
	
	
}
