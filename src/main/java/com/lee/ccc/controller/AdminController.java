package com.lee.ccc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lee.ccc.command.AdminCommand;
import com.lee.ccc.dto.MemberDto;
import com.lee.ccc.dto.OrderDto;

@Controller
public class AdminController {

	@Autowired
	private AdminCommand com;
	
	@RequestMapping("memberList_view")
	public String memberList_view(Model model) { //������ ȸ����ȸ
		List<MemberDto> list = com.memberList();
		model.addAttribute("list", list);
		return "memberList_view";
	}
	
	@RequestMapping("adminUpdate")
	public String adminUpdate(MemberDto dto) { //������ ȸ����������
		if(dto.getMemLevel().equals("������")) {
			dto.setMemLevel("ROLE_ADMIN");
		} else {
			dto.setMemLevel("ROLE_USER");
		}
		com.adminUpdate(dto);
		return "redirect:/memberList_view";
	}
	
	@RequestMapping(value="adminDelete", method = RequestMethod.GET)
	public String adminDelete(MemberDto dto) { //������ ȸ������
		com.adminDelete(dto);
		return "memberList_view";
	}
	
	@RequestMapping("adminOrder_view")
	public String adminOrder_view(Model model) { //������ �ֹ���ȸ
		List<OrderDto> list = com.adminOrder();
		model.addAttribute("list",list);
		return "adminOrder_view";
	}
}
