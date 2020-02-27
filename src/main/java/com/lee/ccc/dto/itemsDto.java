package com.lee.ccc.dto;

import java.sql.Date;
import java.sql.Timestamp;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;






public class itemsDto {
	
	
	/*
	create table sup_items ( 10개의 컬럼
		items_cate number(4) not null,
		items_code number(10) not null primary key,
		items_name  varchar2(50) not null,
		items_quant number(8) not null,
		items_deli number(8),
		items_price number(10),
		items_image varchar2(500),
		itmes_explain varchar2(4000),
		items_stock number(8),
		items_date  date default sysdate
		items_ex_image varchar2(500) );

	 */

	//DB랑 연결할때는 순서 주의
	
	private int items_cate;
	private int items_code;
	private String items_name;
	private int items_quant;
	private int items_deli;
	private int items_price;
	private String items_image;
	private String items_explain;
	private int items_stock;
	private Timestamp items_date;
	private String items_ex_image;
	
	private int page;
	private int perPageNum;
	private int rowStart;
	private int rowEnd;
	
	
	public itemsDto() {
		super();
		this.page = 1;
		this.perPageNum =10;
		
	}


	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		if(page <= 0) {
			this.page =1;
			return;
		}
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if(perPageNum <=0 || perPageNum > 100 ) {
			this.perPageNum =10;
			return;
		}
		this.perPageNum = perPageNum;
	}


	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum)+1;
		return rowStart;
	}


	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}


	public int getRowEnd() {
		rowEnd = rowStart + perPageNum -1;
		return rowEnd;
	}

	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}


	@Override
	public String toString() {
		return "itemsDto [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}












	public itemsDto(int items_cate, int items_code, String items_name, int items_quant, int items_deli, int items_price,
			String items_image, String items_explain, int items_stock, Timestamp items_date, String items_ex_image,
			int page, int perPageNum, int rowStart, int rowEnd) {
		super();
		this.items_cate = items_cate;
		this.items_code = items_code;
		this.items_name = items_name;
		this.items_quant = items_quant;
		this.items_deli = items_deli;
		this.items_price = items_price;
		this.items_image = items_image;
		this.items_explain = items_explain;
		this.items_stock = items_stock;
		this.items_date = items_date;
		this.items_ex_image = items_ex_image;
		this.page = page;
		this.perPageNum = perPageNum;
		this.rowStart = rowStart;
		this.rowEnd = rowEnd;
	}

/*
	public itemsDto(int items_cate, int items_code, String items_name, int items_quant, int items_deli, int items_price,
			String items_image, String items_explain, int items_stock, Timestamp items_date, String items_ex_image) {
		super();
		this.items_cate = items_cate;
		this.items_code = items_code;
		this.items_name = items_name;
		this.items_quant = items_quant;
		this.items_deli = items_deli;
		this.items_price = items_price;
		this.items_image = items_image;
		this.items_explain = items_explain;
		this.items_stock = items_stock;
		this.items_date = items_date;
		this.items_ex_image = items_ex_image;
	}*/















	public int getItems_cate() {
		return items_cate;
	}


	public void setItems_cate(int items_cate) {
		this.items_cate = items_cate;
	}


	public int getItems_code() {
		return items_code;
	}


	public void setItems_code(int items_code) {
		this.items_code = items_code;
	}


	public String getItems_name() {
		return items_name;
	}


	public void setItems_name(String items_name) {
		this.items_name = items_name;
	}


	public int getItems_quant() {
		return items_quant;
	}


	public void setItems_quant(int items_quant) {
		this.items_quant = items_quant;
	}


	public int getItems_deli() {
		return items_deli;
	}


	public void setItems_deli(int items_deli) {
		this.items_deli = items_deli;
	}


	public int getItems_price() {
		return items_price;
	}


	public void setItems_price(int items_price) {
		this.items_price = items_price;
	}


	public String getItems_image() {
		return items_image;
	}


	public void setItems_image(String items_image) {
		this.items_image = items_image;
	}


	public String getItems_explain() {
		return items_explain;
	}


	public void setItems_explain(String items_explain) {
		this.items_explain = items_explain;
	}


	public int getItems_stock() {
		return items_stock;
	}


	public void setItems_stock(int items_stock) {
		this.items_stock = items_stock;
	}


	


	











	public Timestamp getItems_date() {
		return items_date;
	}















	public void setItems_date(Timestamp items_date) {
		this.items_date = items_date;
	}















	public String getItems_ex_image() {
		return items_ex_image;
	}


	public void setItems_ex_image(String items_ex_image) {
		this.items_ex_image = items_ex_image;
	}





	
	
}


