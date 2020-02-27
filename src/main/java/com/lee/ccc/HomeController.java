package com.lee.ccc;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.lee.ccc.command.BItemsCommand;
import com.lee.ccc.command.Command;

import com.lee.ccc.dao.ItemsDao;
import com.lee.ccc.dto.itemsDto;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private Command com;
	private ItemsDao dao;
	
	@Autowired//servlet-context.xml의 bean과 매핑
	private SqlSession sqlSession;
	


	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("home")
	public String home() {
		return "home";
	}
	
	@RequestMapping("header")
	public String header(Locale locale, Model model) {
		return "header";
	}
	
	@RequestMapping("footer")
	public String footer(Locale locale, Model model) {
		return "footer";
	}
	
	@RequestMapping("cart")
	public String cart() {
		return "cart";
	}
	
	@RequestMapping("join_view")
	public String join_view() {
		return "join_view";
	}
	
	@RequestMapping("myPage")
	public String myPage() {
		return "myPage";
	}
	
	@RequestMapping("contact_view")
	public String contact_view() {
		return "contact_view";
	}
	
	@RequestMapping("orderP")
	public String order(HttpServletRequest request, Model model) {
		
		return "orderP";
	}
	
	@RequestMapping("about")
	public String about() {
		return "about";
	}


/*
	// 상품 등록
	@RequestMapping("register_view")
	public String register() {
	return "register_view";*/
	
	
}
