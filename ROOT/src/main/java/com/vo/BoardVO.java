package com.vo;

import java.sql.Timestamp;

public class BoardVO {
	
	private String bNum;
	private String bTitle;
	private String bWriter;
	private String bPass;
	private String bCat;
	private Timestamp bDate;
	private int bReadCount;
	private int bRef;
	private int bStep;
	private int bDepth;
	private String bContents;
	private String bProcuct;
	
	
	public String getbNum() {
		return bNum;
	}
	public void setbNum(String bNum) {
		this.bNum = bNum;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbWriter() {
		return bWriter;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public String getbPass() {
		return bPass;
	}
	public void setbPass(String bPass) {
		this.bPass = bPass;
	}
	public String getbCat() {
		return bCat;
	}
	public void setbCat(String bCat) {
		this.bCat = bCat;
	}
	public Timestamp getbDate() {
		return bDate;
	}
	public void setbDate(Timestamp bDate) {
		this.bDate = bDate;
	}
	public int getbReadCount() {
		return bReadCount;
	}
	public void setbReadCount(int bReadCount) {
		this.bReadCount = bReadCount;
	}
	public int getbRef() {
		return bRef;
	}
	public void setbRef(int bRef) {
		this.bRef = bRef;
	}
	public int getbStep() {
		return bStep;
	}
	public void setbStep(int bStep) {
		this.bStep = bStep;
	}
	public int getbDepth() {
		return bDepth;
	}
	public void setbDepth(int bDepth) {
		this.bDepth = bDepth;
	}
	public String getbContents() {
		return bContents;
	}
	public void setbContents(String bContents) {
		this.bContents = bContents;
	}
	public String getbProcuct() {
		return bProcuct;
	}
	public void setbProcuct(String bProcuct) {
		this.bProcuct = bProcuct;
	}

}
