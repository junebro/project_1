package com.shopping.model.bean;

public class Product {
	
	private int PROTP;
	private String PROCD;
	private String PRONM;
	private int PROSSZ;
	private int PROESZ;
	private String PROCR;
	private int PROPR;
	private String PROIMG;
	private String PROIMG1;
	private String PROIMG2;
	private String PROIMG3;
	private String PRODT;
	private String PROPNT;
	private String PROCMN;
	
	// 찜 
	private String LK;
	
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int pROTP, String pROCD, String pRONM, int pROSSZ, int pROESZ, String pROCR, int pROPR,
			String pROIMG, String pROIMG1, String pROIMG2, String pROIMG3, String pRODT, String pROPNT, String pROCMN,
			String lK) {
		super();
		PROTP = pROTP;
		PROCD = pROCD;
		PRONM = pRONM;
		PROSSZ = pROSSZ;
		PROESZ = pROESZ;
		PROCR = pROCR;
		PROPR = pROPR;
		PROIMG = pROIMG;
		PROIMG1 = pROIMG1;
		PROIMG2 = pROIMG2;
		PROIMG3 = pROIMG3;
		PRODT = pRODT;
		PROPNT = pROPNT;
		PROCMN = pROCMN;
		LK = lK;
	}

	@Override
	public String toString() {
		return "Product [PROTP=" + PROTP + ", PROCD=" + PROCD + ", PRONM=" + PRONM + ", PROSSZ=" + PROSSZ + ", PROESZ="
				+ PROESZ + ", PROCR=" + PROCR + ", PROPR=" + PROPR + ", PROIMG=" + PROIMG + ", PROIMG1=" + PROIMG1
				+ ", PROIMG2=" + PROIMG2 + ", PROIMG3=" + PROIMG3 + ", PRODT=" + PRODT + ", PROPNT=" + PROPNT
				+ ", PROCMN=" + PROCMN + ", LK=" + LK + "]";
	}

	public int getPROTP() {
		return PROTP;
	}

	public void setPROTP(int pROTP) {
		PROTP = pROTP;
	}

	public String getPROCD() {
		return PROCD;
	}

	public void setPROCD(String pROCD) {
		PROCD = pROCD;
	}

	public String getPRONM() {
		return PRONM;
	}

	public void setPRONM(String pRONM) {
		PRONM = pRONM;
	}

	public int getPROSSZ() {
		return PROSSZ;
	}

	public void setPROSSZ(int pROSSZ) {
		PROSSZ = pROSSZ;
	}

	public int getPROESZ() {
		return PROESZ;
	}

	public void setPROESZ(int pROESZ) {
		PROESZ = pROESZ;
	}

	public String getPROCR() {
		return PROCR;
	}

	public void setPROCR(String pROCR) {
		PROCR = pROCR;
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

	public String getPROIMG1() {
		return PROIMG1;
	}

	public void setPROIMG1(String pROIMG1) {
		PROIMG1 = pROIMG1;
	}

	public String getPROIMG2() {
		return PROIMG2;
	}

	public void setPROIMG2(String pROIMG2) {
		PROIMG2 = pROIMG2;
	}

	public String getPROIMG3() {
		return PROIMG3;
	}

	public void setPROIMG3(String pROIMG3) {
		PROIMG3 = pROIMG3;
	}

	public String getPRODT() {
		return PRODT;
	}

	public void setPRODT(String pRODT) {
		PRODT = pRODT;
	}

	public String getPROPNT() {
		return PROPNT;
	}

	public void setPROPNT(String pROPNT) {
		PROPNT = pROPNT;
	}

	public String getPROCMN() {
		return PROCMN;
	}

	public void setPROCMN(String pROCMN) {
		PROCMN = pROCMN;
	}

	public String getLK() {
		return LK;
	}

	public void setLK(String lK) {
		LK = lK;
	}
	
	
	
	
}