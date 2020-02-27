package com.lee.ccc.dao;

import java.util.List;

import com.lee.ccc.dto.MemberDto;
import com.lee.ccc.dto.OrderDto;

public interface AdminDao {
	
public List<MemberDto> memberList();
	
	public void adminUpdate(MemberDto dto);
	
	public void adminDelete(MemberDto dto);
	
	public List<OrderDto> adminOrder();
}
