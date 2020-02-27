package com.lee.ccc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lee.ccc.dto.MemberDto;
import com.lee.ccc.dto.OrderDto;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private SqlSession sql;
	
	@Override
	public List<MemberDto> memberList() {
		return sql.selectList("memberList");
	}
	
	@Override
	public void adminUpdate(MemberDto dto) {
		sql.update("adminUpdate", dto);
	}
	
	@Override
	public void adminDelete(MemberDto dto) {
		sql.delete("adminDelete", dto);
	}
	
	@Override
	public List<OrderDto> adminOrder() {
		return sql.selectList("adminOrder");
	}
}
