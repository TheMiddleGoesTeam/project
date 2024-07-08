package com.vo;

import java.sql.Timestamp;

public class Board_NoticeVO {
	
	private int nNum;
	private String nTitle;
	private String nWriter;
	private String nPass;
	private String nCat;
	private Timestamp nDate;
	private int nReadCount;
	private int nRef;
	private int nStep;
	private int nDepth;
	private String nContents;
	private String nProcuct;
	public int getnNum() {
		return nNum;
	}
	public void setnNum(int nNum) {
		this.nNum = nNum;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnWriter() {
		return nWriter;
	}
	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}
	public String getnPass() {
		return nPass;
	}
	public void setnPass(String nPass) {
		this.nPass = nPass;
	}
	public String getnCat() {
		return nCat;
	}
	public void setnCat(String nCat) {
		this.nCat = nCat;
	}
	public Timestamp getnDate() {
		return nDate;
	}
	public void setnDate(Timestamp nDate) {
		this.nDate = nDate;
	}
	public int getnReadCount() {
		return nReadCount;
	}
	public void setnReadCount(int nReadCount) {
		this.nReadCount = nReadCount;
	}
	public int getnRef() {
		return nRef;
	}
	public void setnRef(int nRef) {
		this.nRef = nRef;
	}
	public int getnStep() {
		return nStep;
	}
	public void setnStep(int nStep) {
		this.nStep = nStep;
	}
	public int getnDepth() {
		return nDepth;
	}
	public void setnDepth(int nDepth) {
		this.nDepth = nDepth;
	}
	public String getnContents() {
		return nContents;
	}
	public void setnContents(String nContents) {
		this.nContents = nContents;
	}
	public String getnProcuct() {
		return nProcuct;
	}
	public void setnProcuct(String nProcuct) {
		this.nProcuct = nProcuct;
	}
	
	
}
