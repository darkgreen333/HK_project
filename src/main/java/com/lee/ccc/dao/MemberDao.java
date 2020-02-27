package com.lee.ccc.dao;

import java.util.List;
import java.util.Map;

import com.lee.ccc.dto.MemberDto;
import com.lee.ccc.dto.OrderDto;
import com.lee.ccc.dto.UserDto;

public interface MemberDao {
	
	//회원가입
			public void signUp(MemberDto dto);
			//아이디 중복확인(회원가입)
			public int idCheck(String memId);
			
			//id 찾기
			public UserDto getUserById(String username);
			
			public void pass_change(Map<String, Object> map, MemberDto dto);
			
			public MemberDto memberModify(String memId);
			
			public void memberUpdate(MemberDto dto);
			
			public int pwCheck(MemberDto dto);
			
			public void memberDelete(MemberDto dto);
			
			public void memberPwChange(MemberDto dto);
			
			public List<OrderDto> orderList(String memId);
			
			//---------------계정 잠금--------------------- 
			public void updateFailureCount(String username);
			
			public int checkFailureCount(String username);
			
			public void updateDisabled(String username);
			
			public void updateFailureCountReset(String username);
		
}
