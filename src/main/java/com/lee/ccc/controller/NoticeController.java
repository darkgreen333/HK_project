package com.lee.ccc.controller;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lee.ccc.dto.NoticeDto;
import com.lee.ccc.dto.NoticePageMaker;
import com.lee.ccc.dto.NoticeSearchCriteria;
import com.lee.ccc.service.NoticeService;

@Controller
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	private NoticeService service;
	
	@RequestMapping(value="/notice_list", method=RequestMethod.GET)
	public void noticeListPage(@ModelAttribute("npvo") NoticeSearchCriteria npvo, Model model) throws Exception {
		model.addAttribute("notice_list", service.noticeListSearch(npvo));
		
		NoticePageMaker noticePageMaker = new NoticePageMaker();
		noticePageMaker.setNpvo(npvo);
		
		noticePageMaker.setNoticeTotalCount(service.noticeListSearchCount(npvo));
		model.addAttribute("noticePageMaker", noticePageMaker);
	}
	
	@RequestMapping(value="/notice_readPage", method=RequestMethod.GET)
	public void noticeRead(@RequestParam("n_num") int n_num, @ModelAttribute("npvo") NoticeSearchCriteria npvo, Model model) throws Exception	{
		//model.addAttribute("notice_readPage", service.noticeListSearch(npvo));
		/*model.addAttribute("noticeRead", service.noticeRead(n_num));
		System.out.println(n_num);*/
		model.addAttribute("notice_list", service.noticeListSearch(npvo));
		model.addAttribute("n_num", n_num);
		
		/*
		NoticePageMaker noticePageMaker = new NoticePageMaker();
		noticePageMaker.setNpvo(npvo);
		
		noticePageMaker.setNoticeTotalCount(service.noticeListSearchCount(npvo));
		model.addAttribute("noticePageMaker", noticePageMaker);
		*/
	}
	
	@RequestMapping("/notice_removePage")
	public String noticeRemove(@RequestParam("n_num") int n_num, NoticeSearchCriteria npvo, RedirectAttributes rttr) throws Exception {
		service.noticeRemove(n_num);
		
		rttr.addAttribute("noticePage", npvo.getNoticePage());
		rttr.addAttribute("noticePerPageNum", npvo.getNoticePerPageNum());
		rttr.addAttribute("noticeSearchType", npvo.getNoticeSearchType());
		rttr.addAttribute("noticeKeyword", npvo.getNoticeKeyword());
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/notice_list";
	}
	
	@RequestMapping(value="/notice_modifyPage", method=RequestMethod.GET)
	public void noticeModifyPageGet(@RequestParam("n_num") int n_num, @ModelAttribute("npvo") NoticeSearchCriteria npvo, Model model) throws Exception {
		//model.addAttribute(service.noticeRead(n_num));
		model.addAttribute("notice_list", service.noticeListSearch(npvo));
		model.addAttribute("n_num", n_num);
		/*
		NoticePageMaker noticePageMaker = new NoticePageMaker();
		noticePageMaker.setNpvo(npvo);
		
		noticePageMaker.setNoticeTotalCount(service.noticeListSearchCount(npvo));
		model.addAttribute("noticePageMaker", noticePageMaker);
		*/
	}
	
	@RequestMapping(value="/notice_modify", method=RequestMethod.POST)
	public String noticeModifyPagePost(HttpServletRequest request, MultipartHttpServletRequest mtfRequest, Model model) throws Exception {
	
		logger.info("register post...");
		NoticeDto dto = new NoticeDto();
		MultipartFile mf = mtfRequest.getFile("n_img");
		
		if(mf.getSize() > 0) {	
			String path = "C:/newUpload/";
			
			String originFileName = mf.getOriginalFilename();
			String safeFile = path + System.currentTimeMillis() + originFileName;
			
			try {
				mf.transferTo(new File(safeFile));
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			dto.setN_num(Integer.parseInt(request.getParameter("n_num")));
			dto.setN_title(request.getParameter("n_title"));
			dto.setN_content(request.getParameter("n_content"));
			dto.setN_img(safeFile);
		} else {
			String def = "C:/newUpload/default.png";
			
			dto.setN_num(Integer.parseInt(request.getParameter("n_num")));
			dto.setN_title(request.getParameter("n_title"));
			dto.setN_content(request.getParameter("n_content"));
			dto.setN_img(def);
		}
		
		service.noticeModify(dto);
		
		
		return "redirect:/notice_list";
	}
	
	@RequestMapping(value="/notice_register", method=RequestMethod.GET)
	public void noticeRegisterGet() throws Exception {
		logger.info("register get...");
	}
	
	@RequestMapping(value="notice_register", method=RequestMethod.POST)
	public String noticeRegisterPost(MultipartHttpServletRequest mtfRequest, HttpServletRequest request, Model model) throws Exception {
		logger.info("register post...");
		NoticeDto dto = new NoticeDto();
			
		MultipartFile mf = mtfRequest.getFile("n_img");
		
		if(mf.getSize() > 0) {
		String path = "C:/newUpload/";
		
		String originFileName = mf.getOriginalFilename();
		String safeFile = path + System.currentTimeMillis() + originFileName;
		String dfile = System.currentTimeMillis()+ originFileName;
		
		try {
			mf.transferTo(new File(safeFile));
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		dto.setN_title(request.getParameter("n_title"));
		dto.setN_content(request.getParameter("n_content"));
		dto.setN_img(safeFile);
		} else {
			String def = "C:/newUpload/default.png";
			
			dto.setN_title(request.getParameter("n_title"));
			dto.setN_content(request.getParameter("n_content"));
			dto.setN_img(def);
		}
		
		service.noticeRegist(dto);
		
		return "redirect:/notice_list";
	}
}
