package com.vo;

import java.sql.Timestamp;

public class Board_ReviewVO{
	
	private int rNum;
	private String rTitle;
	private String rWriter;
	private String rPass;
	private String rCat;
	private Timestamp rDate;
	private int rReadCount;
	private int rRef;
	private int rStep;
	private int rDepth;
	private String rContents;
	private String rProcuct;
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public String getrTitle() {
		return rTitle;
	}
	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}
	public String getrWriter() {
		return rWriter;
	}
	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}
	public String getrPass() {
		return rPass;
	}
	public void setrPass(String rPass) {
		this.rPass = rPass;
	}
	public String getrCat() {
		return rCat;
	}
	public void setrCat(String rCat) {
		this.rCat = rCat;
	}
	public Timestamp getrDate() {
		return rDate;
	}
	public void setrDate(Timestamp rDate) {
		this.rDate = rDate;
	}
	public int getrReadCount() {
		return rReadCount;
	}
	public void setrReadCount(int rReadCount) {
		this.rReadCount = rReadCount;
	}
	public int getrRef() {
		return rRef;
	}
	public void setrRef(int rRef) {
		this.rRef = rRef;
	}
	public int getrStep() {
		return rStep;
	}
	public void setrStep(int rStep) {
		this.rStep = rStep;
	}
	public int getrDepth() {
		return rDepth;
	}
	public void setrDepth(int rDepth) {
		this.rDepth = rDepth;
	}
	public String getrContents() {
		return rContents;
	}
	public void setrContents(String rContents) {
		this.rContents = rContents;
	}
	public String getrProcuct() {
		return rProcuct;
	}
	public void setrProcuct(String rProcuct) {
		this.rProcuct = rProcuct;
	}
	
	

}
