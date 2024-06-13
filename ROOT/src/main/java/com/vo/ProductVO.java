package com.vo;

import java.sql.Timestamp;

public class ProductVO {

	private String pCode;
	private String pName;
	private String pBrand;
	private String pCat;
	private Timestamp pDate;
	private String pComment;
	private int plike;
	private String ptag;
	private String pImg;
	private String pURL;
	
	
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpBrand() {
		return pBrand;
	}
	public void setpBrand(String pBrand) {
		this.pBrand = pBrand;
	}
	public String getpCat() {
		return pCat;
	}
	public void setpCat(String pCat) {
		this.pCat = pCat;
	}
	public Timestamp getpDate() {
		return pDate;
	}
	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}
	public String getpComment() {
		return pComment;
	}
	public void setpComment(String pComment) {
		this.pComment = pComment;
	}
	public int getPlike() {
		return plike;
	}
	public void setPlike(int plike) {
		this.plike = plike;
	}
	public String getPtag() {
		return ptag;
	}
	public void setPtag(String ptag) {
		this.ptag = ptag;
	}
	public String getpImg() {
		return pImg;
	}
	public void setpImg(String pImg) {
		this.pImg = pImg;
	}
	public String getpURL() {
		return pURL;
	}
	public void setpURL(String pURL) {
		this.pURL = pURL;
	}
	
}
