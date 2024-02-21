package com.shopping.model.bean;

public class Product_main {
	
	private int PROTP;
	private String PRONM;
	private int PROPR;
	private String PROIMG;
	private int RVWGR;
	private String PRODT;
	
	
	public Product_main() {
		// TODO Auto-generated constructor stub
	}
	
	public Product_main(int pROTP, String pRONM, int pROPR, String pROIMG, int rVWGR, String pRODT, String lK) {
		super();
		PROTP = pROTP;
		PRONM = pRONM;
		PROPR = pROPR;
		PROIMG = pROIMG;
		RVWGR = rVWGR;
		PRODT = pRODT;
		LK = lK;
	}

	@Override
	public String toString() {
		return "Product_main [PROTP=" + PROTP + ", PRONM=" + PRONM + ", PROPR=" + PROPR + ", PROIMG=" + PROIMG
				+ ", RVWGR=" + RVWGR + ", PRODT=" + PRODT + ", LK=" + LK + "]";
	}

	// 찜 
	private String LK;

	public int getPROTP() {
		return PROTP;
	}

	public void setPROTP(int pROTP) {
		PROTP = pROTP;
	}

	public String getPRONM() {
		return PRONM;
	}

	public void setPRONM(String pRONM) {
		PRONM = pRONM;
	}

	public int getPROPR() {
		return PROPR;
	}

	public void setPROPR(int pROPR) {
		PROPR = pROPR;
	}

	public String getPROIMG() {
		return PROIMG;
	}

	public void setPROIMG(String pROIMG) {
		PROIMG = pROIMG;
	}

	public int getRVWGR() {
		return RVWGR;
	}

	public void setRVWGR(int rVWGR) {
		RVWGR = rVWGR;
	}

	public String getPRODT() {
		return PRODT;
	}

	public void setPRODT(String pRODT) {
		PRODT = pRODT;
	}

	public String getLK() {
		return LK;
	}

	public void setLK(String lK) {
		LK = lK;
	}


	
	
}
