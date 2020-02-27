package com.lee.ccc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.lee.ccc.dto.MemberDto;
import com.lee.ccc.dto.OrderDto;
import com.lee.ccc.dto.UserDto;


@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired(required=false)
	private SqlSession sql;
	
	@Override
	public void signUp(MemberDto dto) {
		System.out.println(sql);
		sql.insert("insertSignup", dto);
	}
	
	/*@Override
	public int login(MemberDto dto) {
		return sql.selectOne("login", dto);
	}
	*/
	
	@Override
	public int idCheck(String memId) {
		System.out.println(sql);
		int result = sql.selectOne("idCheck", memId);
		return result;
	}
	
	@Override
	public void pass_change(Map<String, Object> map, MemberDto dto) {
		map.get("memPw");
        map.get("memEmail");
        
        sql.update("pass_change", map);
        System.out.println(map);
	}
	
	@Override
	public UserDto getUserById(String username) {
		System.out.println("getUserById()");
		return sql.selectOne("selectUser", username);
	}
	
	@Override
	public void updateFailureCount(String username) {
		sql.update("updateFailureCount", username);
	}
	
	@Override
	public int checkFailureCount(String username) {
		return sql.selectOne("checkFailureCount", username);
	}
	
	@Override
	public void updateDisabled(String username) {
		sql.update("updateUnenabled", username);
	}
	
	@Override
	public void updateFailureCountReset(String username) {
		sql.update("updateFailureCountReset", username);
	}

	@Override
	public MemberDto memberModify(String memId) {
		System.out.println(memId);
		return sql.selectOne("memberModify", memId);
	}
	
	@Override
	public void memberUpdate(MemberDto dto) {
		sql.update("memberUpdate", dto);
	}
	
	@Override
	public int pwCheck(MemberDto dto) {
		int result = sql.selectOne("pwCheck", dto);
		return result;
	}
	
	@Override
	public void memberDelete(MemberDto dto) {
		sql.delete("memberDelete", dto);
	}
	
	@Override
	public void memberPwChange(MemberDto dto) {
		sql.update("memberPwChange", dto);
	}
	
	@Override
	public List<OrderDto> orderList(String memId) {
		return sql.selectList("orderList", memId);
	}

}
