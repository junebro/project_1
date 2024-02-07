package com.shopping.model.bean;

public class Tpro {
	
	private String PROTP;
	private String PROCD;
	private String PRONM;
	private String PROSSZ;
	private String PROESZ;
	private String PROCR;
	private String PROPR;
	private String PROIMG;
	private String PROIMG1;
	private String PROIMG2;
	private String PROIMG3;
	private String PROPNT;
	private String PROCMN;
	
		
	@Override
	public String toString() {
		return "Tpro [PROTP=" + PROTP + ", PROCD=" + PROCD + ", PRONM=" + PRONM + ", PROSSZ=" + PROSSZ + ", PROESZ="
				+ PROESZ + ", PROCR=" + PROCR + ", PROPR=" + PROPR + ", PROIMG=" + PROIMG + ", PROIMG1=" + PROIMG1
				+ ", PROIMG2=" + PROIMG2 + ", PROIMG3=" + PROIMG3 + ", PROPNT=" + PROPNT + ", PROCMN=" + PROCMN + "]";
	}

	public Tpro() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Tpro(String pROTP, String pROCD, String pRONM, String pROSSZ, String pROESZ, String pROCR, String pROPR,
			String pROIMG, String pROIMG1, String pROIMG2, String pROIMG3, String pROPNT, String pROCMN) {
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
		PROPNT = pROPNT;
		PROCMN = pROCMN;
	}
	public String getPROTP() {
		return PROTP;
	}
	public void setPROTP(String pROTP) {
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
	public String getPROSSZ() {
		return PROSSZ;
	}
	public void setPROSSZ(String pROSSZ) {
		PROSSZ = pROSSZ;
	}
	public String getPROESZ() {
		return PROESZ;
	}
	public void setPROESZ(String pROESZ) {
		PROESZ = pROESZ;
	}
	public String getPROCR() {
		return PROCR;
	}
	public void setPROCR(String pROCR) {
		PROCR = pROCR;
	}
	public String getPROPR() {
		return PROPR;
	}
	public void setPROPR(String pROPR) {
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
	
	
	
	

}
