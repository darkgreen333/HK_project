package com.lee.ccc.interceptor;
//�̹�� ���� �����ϱ�
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.lee.ccc.dto.MemberDto;

public class AdminInterceptor extends HandlerInterceptorAdapter {
/*
	@Override //��Ʈ�ѷ��� ����Ǳ��� ������ ���θ� Ȯ���ϰ� ����.
	public boolean preHandle(HttpServletRequest req,
			HttpServletResponse res, Object obj) throws Exception{
		
		HttpSession session = req.getSession();
		MemberDto member = (MemberDto)session.getAttribute("member");
		
		if(member == null || member.getMemLevel() != "ROLE_USER") {
			res.sendRedirect("/");
			return false; //���� ó�� ȭ������ �ǵ���
		}
		return true;//preHandle�� ��ȯ���� true�̸� ��Ʈ�ѷ��� ����ǰ� false�� ���� ����
	}*/
}
