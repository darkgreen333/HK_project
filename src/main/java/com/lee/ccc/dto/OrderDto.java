package com.lee.ccc.dto;

import java.util.Date;

public class OrderDto {
	
	private String orderNum;
	private int orderCode;
	private String orderId;
	private String orderRecipient;
	private String orderAdd1;
	private String orderAdd2;
	private String orderAdd3;
	private int orderDeli;
	private int orderQuant;
	private int orderPrice;
	private String orderPhone;
	private Date orderDate;
	private String orderPm;
	private String orderState;
	private String orderPimage;
	private String orderPname;
	private int orderAmount;
	
	

	public OrderDto() {
		
	}
	
	public OrderDto(String orderNum, int orderCode, String orderId, String orderRecipient, String orderAdd1, String orderAdd2,
			String orderAdd3, int orderDeli, int orderQuant, int orderPrice, String orderPhone,
			String orderPm, String orderState, String orderPimage, String orderPname ,int orderAmount) {
		super();
		this.orderNum = orderNum;
		this.orderCode = orderCode;
		this.orderId = orderId;
		this.orderRecipient = orderRecipient;
		this.orderAdd1 = orderAdd1;
		this.orderAdd2 = orderAdd2;
		this.orderAdd3 = orderAdd3;
		this.orderDeli = orderDeli;
		this.orderQuant = orderQuant;
		this.orderPrice = orderPrice;
		this.orderPhone = orderPhone;
		this.orderPm = orderPm;
		this.orderState = orderState;
		this.orderPimage = orderPimage;
		this.orderPname = orderPname;
		this.orderAmount = orderAmount;
	}
	
	public int getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}
	
	public String getOrderPimage() {
		return orderPimage;
	}

	public void setOrderPimage(String orderPimage) {
		this.orderPimage = orderPimage;
	}

	public String getOrderPname() {
		return orderPname;
	}

	public void setOrderPname(String orderPname) {
		this.orderPname = orderPname;
	}

	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getOrderRecipient() {
		return orderRecipient;
	}
	public void setOrderRecipient(String orderRecipient) {
		this.orderRecipient = orderRecipient;
	}
	public String getOrderAdd1() {
		return orderAdd1;
	}
	public void setOrderAdd1(String orderAdd1) {
		this.orderAdd1 = orderAdd1;
	}
	public String getOrderAdd2() {
		return orderAdd2;
	}
	public void setOrderAdd2(String orderAdd2) {
		this.orderAdd2 = orderAdd2;
	}
	public String getOrderAdd3() {
		return orderAdd3;
	}
	public void setOrderAdd3(String orderAdd3) {
		this.orderAdd3 = orderAdd3;
	}
	public int getOrderDeli() {
		return orderDeli;
	}
	public void setOrderDeli(int orderDeli) {
		this.orderDeli = orderDeli;
	}
	public int getOrderQuant() {
		return orderQuant;
	}
	public void setOrderQuant(int orderQuant) {
		this.orderQuant = orderQuant;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getOrderPhone() {
		return orderPhone;
	}
	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderPm() {
		return orderPm;
	}
	public void setOrderPm(String orderPm) {
		this.orderPm = orderPm;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
}
