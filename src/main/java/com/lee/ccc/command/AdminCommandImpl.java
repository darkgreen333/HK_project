package com.lee.ccc.command;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lee.ccc.dao.AdminDao;
import com.lee.ccc.dto.MemberDto;
import com.lee.ccc.dto.OrderDto;

@Service
public class AdminCommandImpl implements AdminCommand {
	
	@Autowired
	private AdminDao dao;
	
	@Override
	public List<MemberDto> memberList() {
		return dao.memberList();
	}
	
	@Override
	public void adminUpdate(MemberDto dto) {
		dao.adminUpdate(dto);
	}
	
	@Override
	public void adminDelete(MemberDto dto) {
		dao.adminDelete(dto);
	}
	
	@Override
	public List<OrderDto> adminOrder() {
		return dao.adminOrder();
	}

}
