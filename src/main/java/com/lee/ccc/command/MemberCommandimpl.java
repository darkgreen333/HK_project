package com.lee.ccc.command;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.lee.ccc.dao.MemberDao;
import com.lee.ccc.dto.MemberDto;
import com.lee.ccc.dto.OrderDto;
import com.lee.ccc.dto.UserDto;

@Service
public class MemberCommandimpl implements MemberCommand {
	
	BCryptPasswordEncoder passwordEncoder;
	@Autowired //생성자로 해주어야 에러 없음
	public MemberCommandimpl(BCryptPasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
	}
	
	@Autowired
	private MemberDao dao;
	
	@Override
	public void signUp(MemberDto dto) {
		dao.signUp(dto);
	}
	
	@Override
	public int idCheck(String memId) {
		int result = dao.idCheck(memId);
		return result;
	}
	
	@Override
	public void pass_change(Map<String, Object> map, MemberDto dto) {
		dao.pass_change(map,dto);
	}
	
	@Override
	public UserDto getUserById(String username) {
		return dao.getUserById(username);
	}
	
	@Override
    public void countFailure(String username) {
        dao.updateFailureCount(username);
    }
	
	@Override
	public int checkFailureCount(String username) {
        return dao.checkFailureCount(username);
    }
	
	@Override
	public void disabledUsername(String username) {
        dao.updateDisabled(username);
    }
	
	@Override
	public void resetFailureCnt(String username) {
		dao.updateFailureCountReset(username);
	}
	
	@Override
	public MemberDto memberModify(String memId) {
		return dao.memberModify(memId);
	}
	
	@Override
	public void memberUpdate(MemberDto dto) {
		dao.memberUpdate(dto);
	}
	
	@Override
	public boolean pwCheck(MemberDto dto) {
		UserDto user = (UserDto) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		boolean result = passwordEncoder.matches(dto.getMemPw(), user.getPassword());
		return result;
	}
	
	@Override
	public void memberDelete(MemberDto dto) {
		dao.memberDelete(dto);
	}
	
	@Override
	public void memberPwChange(MemberDto dto) {
		dao.memberPwChange(dto);
	}
	
	@Override
	public List<OrderDto> orderList(String memId) {
		return dao.orderList(memId);
	}

}
