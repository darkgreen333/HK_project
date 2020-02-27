package com.lee.ccc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lee.ccc.dto.OrderDto;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Autowired
	private SqlSession sql;
	
	@Override
	public void paymentCheck(OrderDto dto) {
		sql.insert("orderInfo", dto);
	}

}
