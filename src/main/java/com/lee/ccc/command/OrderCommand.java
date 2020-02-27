package com.lee.ccc.command;

import com.lee.ccc.dto.OrderDto;

public interface OrderCommand {
	public void paymentCheck(OrderDto dto);
}
