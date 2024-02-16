package com.shopping.model.bean;

public class Grade {
	private String GRADE;
	private int COUNT;
	private int PER;
	private String TEXT;
	
	public Grade() {
		// TODO Auto-generated constructor stub
	}
	
	
	public Grade(String gRADE, int cOUNT, int pER, String tEXT) {
		super();
		GRADE = gRADE;
		COUNT = cOUNT;
		PER = pER;
		TEXT = tEXT;
	}
	@Override
	public String toString() {
		return "Grade [GRADE=" + GRADE + ", COUNT=" + COUNT + ", PER=" + PER + ", TEXT=" + TEXT + "]";
	}
	public String getGRADE() {
		return GRADE;
	}
	public void setGRADE(String gRADE) {
		GRADE = gRADE;
	}
	public int getCOUNT() {
		return COUNT;
	}
	public void setCOUNT(int cOUNT) {
		COUNT = cOUNT;
	}
	public int getPER() {
		return PER;
	}
	public void setPER(int pER) {
		PER = pER;
	}
	public String getTEXT() {
		return TEXT;
	}
	public void setTEXT(String tEXT) {
		TEXT = tEXT;
	}
	
	
	
	
	
}
