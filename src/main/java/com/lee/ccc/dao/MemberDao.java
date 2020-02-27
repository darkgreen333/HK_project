package com.lee.ccc.dao;

import java.util.List;
import java.util.Map;

import com.lee.ccc.dto.MemberDto;
import com.lee.ccc.dto.OrderDto;
import com.lee.ccc.dto.UserDto;

public interface MemberDao {
	
	//ȸ������
			public void signUp(MemberDto dto);
			//���̵� �ߺ�Ȯ��(ȸ������)
			public int idCheck(String memId);
			
			//id ã��
			public UserDto getUserById(String username);
			
			public void pass_change(Map<String, Object> map, MemberDto dto);
			
			public MemberDto memberModify(String memId);
			
			public void memberUpdate(MemberDto dto);
			
			public int pwCheck(MemberDto dto);
			
			public void memberDelete(MemberDto dto);
			
			public void memberPwChange(MemberDto dto);
			
			public List<OrderDto> orderList(String memId);
			
			//---------------���� ���--------------------- 
			public void updateFailureCount(String username);
			
			public int checkFailureCount(String username);
			
			public void updateDisabled(String username);
			
			public void updateFailureCountReset(String username);
		
}
