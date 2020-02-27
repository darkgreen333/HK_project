package com.lee.ccc.dto;

import java.util.Date;

public class BoardDto {
	private Integer bNo; 
	private String bTitle; 
	private String bContent; 
	private String bWriter;
	private Date bRdate;
	private Integer bHit;
	
	public BoardDto() {
		
	}
	
	public BoardDto(Integer bNo, String bTitle, String bContent, String bWriter, Date bRdate, Integer bHit) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.bRdate = bRdate;
		this.bHit = bHit;
	}
	
	public Integer getbNo() {
		return bNo;
	}
	public void setbNo(Integer bNo) {
		this.bNo = bNo;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getbWriter() {
		return bWriter;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public Date getbRdate() {
		return bRdate;
	}
	public void setbRdate(Date bRdate) {
		this.bRdate = bRdate;
	}
	public Integer getbHit() {
		return bHit;
	}
	public void setbHit(Integer bHit) {
		this.bHit = bHit;
	}
}
