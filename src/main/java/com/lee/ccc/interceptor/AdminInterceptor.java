package com.lee.ccc.interceptor;
//이방법 현재 보류하기
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.lee.ccc.dto.MemberDto;

public class AdminInterceptor extends HandlerInterceptorAdapter {
/*
	@Override //컨트롤러가 실행되기전 관리자 여부를 확인하고 싶음.
	public boolean preHandle(HttpServletRequest req,
			HttpServletResponse res, Object obj) throws Exception{
		
		HttpSession session = req.getSession();
		MemberDto member = (MemberDto)session.getAttribute("member");
		
		if(member == null || member.getMemLevel() != "ROLE_USER") {
			res.sendRedirect("/");
			return false; //가장 처음 화면으로 되돌림
		}
		return true;//preHandle은 반환값이 true이면 컨트롤러로 진행되고 false면 진행 멈춤
	}*/
}
