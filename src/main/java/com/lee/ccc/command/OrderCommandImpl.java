package com.lee.ccc.command;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lee.ccc.dao.OrderDao;
import com.lee.ccc.dto.OrderDto;

@Service
public class OrderCommandImpl implements OrderCommand {

	@Autowired
	private OrderDao dao;
	
	@Override
	public void paymentCheck(OrderDto dto) {
		dao.paymentCheck(dto);
	}

}
