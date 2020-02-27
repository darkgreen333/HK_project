package com.lee.ccc.controller;

import java.awt.Window;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.lee.ccc.command.OrderCommand;
import com.lee.ccc.dao.IDao;
import com.lee.ccc.dao.OrderDao;
import com.lee.ccc.dao.OrderDaoImpl;
import com.lee.ccc.dto.OrderDto;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

@Controller
public class OrderController {
	
	@Autowired
	private OrderCommand com;
	
	@Autowired
	private IDao dao;
	
	@RequestMapping("order_view")
	public String order_view(HttpServletRequest req,Model model) {
	    	String pimage = req.getParameter("pimage");
	    	System.out.println(pimage);
	    	
		    int code = Integer.parseInt(req.getParameter("code"));
		    String pname = req.getParameter("pname");
		    String explain = req.getParameter("explain");
		    int price = Integer.parseInt(req.getParameter("sell_price"));
		    int deli = Integer.parseInt(req.getParameter("deli"));
		    int amount = Integer.parseInt(req.getParameter("amount"));
		    int sum = Integer.parseInt(req.getParameter("sum"));
		    int stock = Integer.parseInt(req.getParameter("stock"));
		    
		    System.out.println(code);
		    
		    model.addAttribute("image", pimage);
		    model.addAttribute("code", code);
		    model.addAttribute("name", pname);
		    model.addAttribute("explain", explain);
		    model.addAttribute("price", price);
		    model.addAttribute("deli", deli);
		    model.addAttribute("amount", amount);
		    model.addAttribute("sum", sum);
		    model.addAttribute("stock", stock);
		    
		    
		return "order_view";
	}
	
	
	@RequestMapping(value= "paymentComplete", method = RequestMethod.GET)
	@ResponseBody
	public String paymentCheck(HttpServletRequest req,Principal principal,Model model) {
		
		String orderNum = req.getParameter("code");
		int orderCode = Integer.parseInt(req.getParameter("code"));
		String orderId = principal.getName();
		String orderRecipient = req.getParameter("recipient");
		String orderAdd1 = req.getParameter("postcode");
		String orderAdd2 = req.getParameter("addr1");
		String orderAdd3 = req.getParameter("addr2");
		String orderPm = req.getParameter("pay_method");
		String orderPhone = req.getParameter("tel");
		int orderDeli = Integer.parseInt(req.getParameter("deli"));
		int orderQuant = Integer.parseInt(req.getParameter("quant"));
		int orderPrice = Integer.parseInt(req.getParameter("price"));
		String orderPimage = req.getParameter("image");
		String orderPname = req.getParameter("name");
		int orderAmount = Integer.parseInt(req.getParameter("amount"));
		System.out.println(orderAmount);
		System.out.println(orderNum);
		
		OrderDto dto = new OrderDto(orderNum,orderCode,orderId,orderRecipient,orderAdd1,orderAdd2,orderAdd3,
				orderDeli,orderQuant,orderPrice,orderPhone,orderPm,null,orderPimage,orderPname,orderAmount);
		com.paymentCheck(dto);
		/*
		JSONObject json = new JSONObject();
		json.put("orderNum", dto.getOrderNum());
		*/
		
		String orderNum1 = dto.getOrderNum();
		return orderNum1;
	}
	
	@RequestMapping("complete_view")
	public String complete_view(HttpServletRequest req,Model model) {
		
		String orderNum = req.getParameter("orderNum");
		System.out.println(orderNum);
		/*
		OrderDto dto = dao.orderPage(orderNum);
		System.out.println("dto" + dto);
		
		model.addAttribute("oPage",dto);*/
		
		model.addAttribute("orderNum",orderNum);
		return "complete_view";
	}
	
	
}
