package com.lee.ccc.command;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.lee.ccc.dto.MemberDto;
import com.lee.ccc.dto.OrderDto;
import com.lee.ccc.dto.UserDto;

public interface MemberCommand {
	
	public void signUp(MemberDto dto); //ȸ������
	
	public int idCheck(String memId); //���̵� �ߺ�Ȯ��(ȸ������)
	
	public UserDto getUserById(String username); //id ã��
	
	public void pass_change(Map<String, Object> map, MemberDto dto); //���ã��
	
	public MemberDto memberModify(String memId); //ȸ�� ����
	
	public void memberUpdate(MemberDto dto); //ȸ�� ���� ����
	
	public boolean pwCheck(MemberDto dto);
	
	public void memberDelete(MemberDto dto); //ȸ�� Ż��
	
	public void memberPwChange(MemberDto dto); //��й�ȣ����
	
	public List<OrderDto> orderList(String memId);
	
	//---------------���� ���--------------------- 
	public void countFailure(String username);
	
	public int checkFailureCount(String username);
	
	public void disabledUsername(String username);
	
	public void resetFailureCnt(String username);
	

}
