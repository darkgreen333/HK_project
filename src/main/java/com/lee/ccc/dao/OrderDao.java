package com.lee.ccc.dao;

import com.lee.ccc.dto.OrderDto;

public interface OrderDao {
	
	public void paymentCheck(OrderDto dto);
}
