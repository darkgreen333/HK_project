package com.lee.ccc.dto;

import java.sql.Date;

public class NoticeDto {
	private int n_num;
	private String n_title;
	private String n_content;
	private String n_writer;
	private Date n_regdate;
	private String n_img;
	
	public NoticeDto() {
		super();
	}
	
	public NoticeDto(int n_num, String n_title, String n_content, String n_writer, Date n_regdate, String n_img) {
		super();
		this.n_num = n_num;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_writer = n_writer;
		this.n_regdate = n_regdate;
		this.n_img = n_img;
	}

	public int getN_num() {
		return n_num;
	}

	public void setN_num(int n_num) {
		this.n_num = n_num;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getN_writer() {
		return n_writer;
	}

	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}

	public Date getN_regdate() {
		return n_regdate;
	}

	public void setN_regdate(Date n_regdate) {
		this.n_regdate = n_regdate;
	}
	
	public String getN_img() {
		return n_img;
	}
	
	public void setN_img(String n_img) {
		this.n_img = n_img;
	}
	
	@Override
	public String toString() {
		return "NoticeDto [n_num=" + n_num + ", n_title=" + n_title + ", n_content=" + n_content + ", n_writer="
				+ n_writer + ", n_regdate=" + n_regdate + "]";
	}
}
