package com.shopping.model.bean;

public class Member {
	private String MBRCD; // 고객 코드
	private String MBRID; // 고객 아이디
	private String MBRNM; // 이름
	private String MBRPW; // 비번
	private String MBRAR; // 주소
	private String MBRHP; // 전화번호
	private String MBREM; // 이메일
	private int MBRPT; // 포인트
	private String MBRBT; // 생일
	private String MBRGD; // 성별
	
	
	
	
	public Member(String mBRCD, String mBRID, String mBRNM, String mBRPW, String mBRAR, String mBRHP, String mBREM,
			int mBRPT, String mBRBT, String mBRGD) {
		super();
		MBRCD = mBRCD;
		MBRID = mBRID;
		MBRNM = mBRNM;
		MBRPW = mBRPW;
		MBRAR = mBRAR;
		MBRHP = mBRHP;
		MBREM = mBREM;
		MBRPT = mBRPT;
		MBRBT = mBRBT;
		MBRGD = mBRGD;
	}
	
	public String getMBRCD() {
		return MBRCD;
	}
	public void setMBRCD(String mBRCD) {
		MBRCD = mBRCD;
	}
	public String getMBRID() {
		return MBRID;
	}
	public void setMBRID(String mBRID) {
		MBRID = mBRID;
	}
	public String getMBRNM() {
		return MBRNM;
	}
	public void setMBRNM(String mBRNM) {
		MBRNM = mBRNM;
	}
	public String getMBRPW() {
		return MBRPW;
	}
	public void setMBRPW(String mBRPW) {
		MBRPW = mBRPW;
	}
	public String getMBRAR() {
		return MBRAR;
	}
	public void setMBRAR(String mBRAR) {
		MBRAR = mBRAR;
	}
	public String getMBRHP() {
		return MBRHP;
	}
	public void setMBRHP(String mBRHP) {
		MBRHP = mBRHP;
	}
	public String getMBREM() {
		return MBREM;
	}
	public void setMBREM(String mBREM) {
		MBREM = mBREM;
	}
	public int getMBRPT() {
		return MBRPT;
	}
	public void setMBRPT(int mBRPT) {
		MBRPT = mBRPT;
	}
	public String getMBRBT() {
		return MBRBT;
	}
	public void setMBRBT(String mBRBT) {
		MBRBT = mBRBT;
	}
	public String getMBRGD() {
		return MBRGD;
	}
	public void setMBRGD(String mBRGD) {
		MBRGD = mBRGD;
	}
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

}
