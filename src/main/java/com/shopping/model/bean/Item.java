package com.shopping.model.bean;

public class Item {
	
	private String ITMMD;
	private String ITMFD;
	private int ITMOD;
	private int ITMCD;
	private int ITMNM;
	
	public Item() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "Item [ITMMD=" + ITMMD + ", ITMFD=" + ITMFD + ", ITMOD=" + ITMOD + ", ITMCD=" + ITMCD + ", ITMNM="
				+ ITMNM + "]";
	}
	public Item(String iTMMD, String iTMFD, int iTMOD, int iTMCD, int iTMNM) {
		super();
		ITMMD = iTMMD;
		ITMFD = iTMFD;
		ITMOD = iTMOD;
		ITMCD = iTMCD;
		ITMNM = iTMNM;
	}
	public String getITMMD() {
		return ITMMD;
	}
	public void setITMMD(String iTMMD) {
		ITMMD = iTMMD;
	}
	public String getITMFD() {
		return ITMFD;
	}
	public void setITMFD(String iTMFD) {
		ITMFD = iTMFD;
	}
	public int getITMOD() {
		return ITMOD;
	}
	public void setITMOD(int iTMOD) {
		ITMOD = iTMOD;
	}
	public int getITMCD() {
		return ITMCD;
	}
	public void setITMCD(int iTMCD) {
		ITMCD = iTMCD;
	}
	public int getITMNM() {
		return ITMNM;
	}
	public void setITMNM(int iTMNM) {
		ITMNM = iTMNM;
	}
	
	

}
