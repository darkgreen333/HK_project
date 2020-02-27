package com.lee.ccc.dto;


import java.util.Date;

public class MemberDto {
	
	private String memId;
	private String memLevel;
	private String memPw;
	private String memName;
	private String memPhone;
	private String memAdd1;
	private String memAdd2;
	private String memAdd3;
	private String memEmail;
	private Date regDate;
	
	public MemberDto() {
		
	}
	
	public MemberDto(String memId,String memLevel, String memPw, String memName, String memPhone, String memAdd1, String memAdd2,
			String memAdd3, String memEmail, Date regDate) {
		super();
		this.memId = memId;
		this.memLevel = memLevel;
		this.memPw = memPw;
		this.memName = memName;
		this.memPhone = memPhone;
		this.memAdd1 = memAdd1;
		this.memAdd2 = memAdd2;
		this.memAdd3 = memAdd3;
		this.memEmail = memEmail;
		this.regDate = regDate;
	}
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemAdd1() {
		return memAdd1;
	}
	public void setMemAdd1(String memAdd1) {
		this.memAdd1 = memAdd1;
	}
	public String getMemAdd2() {
		return memAdd2;
	}
	public void setMemAdd2(String memAdd2) {
		this.memAdd2 = memAdd2;
	}
	public String getMemAdd3() {
		return memAdd3;
	}
	public void setMemAdd3(String memAdd3) {
		this.memAdd3 = memAdd3;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "MemberDto [memId=" + memId + ", memPw=" + memPw + ", memName=" + memName + ", memPhone=" + memPhone
				+ ", memAdd1=" + memAdd1 + ", memAdd2=" + memAdd2 + ", memAdd3=" + memAdd3 + ", memEmail=" + memEmail
				+ ", regDate=" + regDate + "]";
	}

	public String getMemLevel() {
		return memLevel;
	}

	public void setMemLevel(String memLevel) {
		this.memLevel = memLevel;
	}
	
	
}
