package com.lee.ccc.command;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.lee.ccc.dto.MemberDto;
import com.lee.ccc.dto.OrderDto;
import com.lee.ccc.dto.UserDto;

public interface MemberCommand {
	
	public void signUp(MemberDto dto); //회원가입
	
	public int idCheck(String memId); //아이디 중복확인(회원가입)
	
	public UserDto getUserById(String username); //id 찾기
	
	public void pass_change(Map<String, Object> map, MemberDto dto); //비번찾기
	
	public MemberDto memberModify(String memId); //회원 정보
	
	public void memberUpdate(MemberDto dto); //회원 정보 수정
	
	public boolean pwCheck(MemberDto dto);
	
	public void memberDelete(MemberDto dto); //회원 탈퇴
	
	public void memberPwChange(MemberDto dto); //비밀번호변경
	
	public List<OrderDto> orderList(String memId);
	
	//---------------계정 잠금--------------------- 
	public void countFailure(String username);
	
	public int checkFailureCount(String username);
	
	public void disabledUsername(String username);
	
	public void resetFailureCnt(String username);
	

}
