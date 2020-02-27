package com.lee.ccc.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lee.ccc.command.BItemsCommand;
import com.lee.ccc.command.Command;
import com.lee.ccc.dao.IDao;
import com.lee.ccc.dao.ItemsDao;
import com.lee.ccc.dto.PageMaker;
import com.lee.ccc.dto.SearchCriteria;

import com.lee.ccc.dto.itemsDto;


import net.sf.json.JSONArray;


@Controller
@RequestMapping
public class ItemController {
	

	
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);



	
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private IDao dao;
	
	
	
	//������ ������(��ǰ���,��ȸ���)
	@RequestMapping("admin_page")
	public String admin_page() {
		return "admin_page";
	}
	
	
	
	//-----------------------------    ADMIN    --------------------------
	
	//��ǰ���
	@RequestMapping("register")
	public String register(HttpServletRequest request,MultipartHttpServletRequest mtfRequest, Model model) throws Exception {
		itemsDto dto = new itemsDto();
	

		
		
		String src = mtfRequest.getParameter("src");
		System.out.println("src value : " + src);
		MultipartFile mf1 = mtfRequest.getFile("items_image");
		MultipartFile mf2 = mtfRequest.getFile("items_ex_image");
		String path = "C:/newUpload/"; 
		
		String originFileName1 = mf1.getOriginalFilename(); //���� ���޵� ���� �̸�
		String originFileName2 = mf2.getOriginalFilename(); //���� ���޵� ���� �̸�
		long fileSize1 = mf1.getSize(); //���ε�� ���� ũ��
		long fileSize2 = mf2.getSize(); //���ε�� ���� ũ��
		System.out.println("originFileName1 : " + originFileName1);
		System.out.println("originFileName2 : " + originFileName2);
		System.out.println("fileSize1 : " + fileSize1);
		System.out.println("fileSize2 : " + fileSize2);
		
		
		//������ ������ �̸��� �ٲپ� ����(�����̸� �ߺ� ���ϱ� ���� �ð��� �տ� ����)
		String safeFile1 = path + System.currentTimeMillis() + originFileName1;
		String safeFile2 = path + System.currentTimeMillis() + originFileName2;
		String dfile1 = System.currentTimeMillis() + originFileName1;
		String dfile2 = System.currentTimeMillis() + originFileName2;
		
		try {
			mf1.transferTo(new File(safeFile1)); //MultipartFile1��ü�� �Ϲ� ���� ��ü�� ��ȯ
			mf2.transferTo(new File(safeFile2)); //MultipartFile2��ü�� �Ϲ� ���� ��ü�� ��ȯ
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("author",src);
		model.addAttribute("fileName1",dfile1);
		model.addAttribute("fileName2",dfile2);
		model.addAttribute("fileSize1",fileSize1);
		model.addAttribute("fileSize2",fileSize2);
		
		String real_save_path = mtfRequest.getServletContext().getRealPath(path);
		
		
		
		
		//dto�� �־���
		int items_cate = Integer.parseInt(request.getParameter("items_cate"));
		dto.setItems_cate(items_cate);
		/*
		String items_cate_i = request.getParameter("items_cate");
		int itmes_cate = Integer.parseInt(request.getParameter("items_cate"));*/
		dto.setItems_name(request.getParameter("items_name"));
		dto.setItems_quant(Integer.parseInt(request.getParameter("items_quant")));
		dto.setItems_deli(Integer.parseInt(request.getParameter("items_deli")));
		dto.setItems_price(Integer.parseInt(request.getParameter("items_price")));
		dto.setItems_image(safeFile1);
		dto.setItems_stock(Integer.parseInt(request.getParameter("items_stock")));
		dto.setItems_explain(request.getParameter("items_explain"));
		dto.setItems_ex_image(safeFile2);

		if(items_cate == 1) {
			dao.register1(dto); //dao�޼ҵ� ȣ��
		}
		else if(items_cate == 2) {
			dao.register2(dto);
		}
		else if(items_cate == 3) {
			dao.register3(dto);
		}
		else if(items_cate == 4) {
			dao.register4(dto);
		}
		else if(items_cate == 5) {
			dao.register5(dto);
		}
		else if(items_cate == 6) {
			dao.register6(dto);
		}
		else {
			return "register_view";
		}
		
		
		
		
		
		return "redirect:register_list";
		
	}
	
	//��ǰ��� ������ ���
	@RequestMapping("register_view")
	public String register_view() {
		return "register_view";
	}
	
	
	
	/* ����¡,�˻����� �� list
	//��ǰ ���
	@RequestMapping("register_list")
	public String register_list(Model model) throws Exception {//�����Ұ� �����Ƿ� request�Ⱦ�
		model.addAttribute("list", dao.register_list()); //key�� list
		return "register_list";
		
	}*/
	
	
	
	//��ǰ ��� (����¡ + �˻�)
	@RequestMapping("register_list")
	public String register_list(Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception {
		model.addAttribute("list", dao.register_list(scri)); //key�� list
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setDto(scri);
		pageMaker.setTotalCount(dao.listCount(scri));
		model.addAttribute("pageMaker",pageMaker);
		
		return "register_list";
		
	}
	
	//��ǰ �� ��ȸ
	@RequestMapping("register_retrieve")
	public String items_view(@RequestParam("n")int n,Model model) throws Exception {
		itemsDto dto = dao.register_retrieve(n);
		

		
		model.addAttribute("register_retrieve",dto);
		return "register_retrieve";
		
	}
	
	//��ǰ ���� (��ȸ)
	@RequestMapping("register_modify")
	public String itmes_modify(@RequestParam("n") int n,Model model) throws Exception {
		
		itemsDto dto = dao.register_retrieve(n);
		model.addAttribute("register_retrieve",dto);
		return "register_modify";
	}
	

	//��ǰ ���� (����)
	@RequestMapping("register_modify1")
	public String register_modify(MultipartHttpServletRequest mtfRequest,HttpServletRequest request, Model model) throws Exception{
		//dto�� �־���
		itemsDto dto = new itemsDto();
		System.out.println("1");
		
		
		String src = mtfRequest.getParameter("src");
		System.out.println("src value : " + src);
		MultipartFile mf1 = mtfRequest.getFile("items_image");
		MultipartFile mf2 = mtfRequest.getFile("items_ex_image");
		String path = "C:/newUpload/"; 
		
		String originFileName1 = mf1.getOriginalFilename(); //���� ���޵� ���� �̸�
		String originFileName2 = mf2.getOriginalFilename(); //���� ���޵� ���� �̸�
		long fileSize1 = mf1.getSize(); //���ε�� ���� ũ��
		long fileSize2 = mf2.getSize(); //���ε�� ���� ũ��
		System.out.println("originFileName1 : " + originFileName1);
		System.out.println("originFileName2 : " + originFileName2);
		System.out.println("fileSize1 : " + fileSize1);
		System.out.println("fileSize2 : " + fileSize2);
		
		//������ ������ �̸��� �ٲپ� ����(�����̸� �ߺ� ���ϱ� ���� �ð��� �տ� ����)
		String safeFile1 = path + System.currentTimeMillis() + originFileName1;
		String safeFile2 = path + System.currentTimeMillis() + originFileName2;
		String dfile1 = System.currentTimeMillis() + originFileName1;
		String dfile2 = System.currentTimeMillis() + originFileName2;
		
		try {
			mf1.transferTo(new File(safeFile1)); //MultipartFile1��ü�� �Ϲ� ���� ��ü�� ��ȯ
			mf2.transferTo(new File(safeFile2)); //MultipartFile2��ü�� �Ϲ� ���� ��ü�� ��ȯ
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("author",src);
		model.addAttribute("fileName1",dfile1);
		model.addAttribute("fileName2",dfile2);
		model.addAttribute("fileSize1",fileSize1);
		model.addAttribute("fileSize2",fileSize2);
		
		String real_save_path = mtfRequest.getServletContext().getRealPath(path);
		

		
		
		
		String items_cate = request.getParameter("items_cate");
		System.out.println("items_cate");
		System.out.println(items_cate);
		dto.setItems_cate(Integer.parseInt(items_cate));
	
		dto.setItems_code(Integer.parseInt(request.getParameter("items_code")));
		
		dto.setItems_name(request.getParameter("items_name"));
	
		dto.setItems_quant(Integer.parseInt(request.getParameter("items_quant")));
	
		dto.setItems_deli(Integer.parseInt(request.getParameter("items_deli")));
		
		dto.setItems_price(Integer.parseInt(request.getParameter("items_price")));

		dto.setItems_image(safeFile1);
	
		dto.setItems_stock(Integer.parseInt(request.getParameter("items_stock")));

		dto.setItems_explain(request.getParameter("items_explain"));

		dto.setItems_ex_image(safeFile2);
		
		
	
		dao.register_modify(dto);
		System.out.println("2");
		return "redirect:register_list";

		
	}

	//��ǰ ����
	@RequestMapping("register_delete")
	public String delete(HttpServletRequest request,Model model,@RequestParam("n") int n) {
		System.out.println("delete");
		//dao.register_delete(Integer.parseInt(("items_code")));
		System.out.println(n);
		
		dao.register_delete(n);
		return "redirect:register_list";
				
	}

//-----------------------------    USER    --------------------------

	
	//user list
	@RequestMapping("userList")
	public String userList(
			@RequestParam(value="bed", required=false) String bed,//��ü����
			@RequestParam(value="table", required=false) String table,
			@RequestParam(value="chair", required=false) String chair,
			@RequestParam(value="sofa", required=false)String sofa,
			@RequestParam(value="bookshelf", required=false)String bookshelf,
			@RequestParam(value="etc", required=false)String etc,
			Model model)throws Exception{
		
		itemsDto dto = new itemsDto();
		
		int items_cate = 0;
		
		
		if(bed != null) {
		//dto.setItems_cate(1);
		items_cate=1;
		model.addAttribute("bed", "bed");
		
		}
		
		
		else if(table != null) {
		//dto.setItems_cate(2);
		items_cate=2;
		model.addAttribute("table", "table");
		}
		
		else if(chair != null) {
		items_cate=3;
		model.addAttribute("chair", "chair");
		}
		
		else if(sofa != null) {
		items_cate=4;
		model.addAttribute("sofa", "sofa");
		}
		
		else if(bookshelf != null) {
		items_cate=5;
		model.addAttribute("bookshelf", "bookshelf");
		}
		
		else if(etc != null) {
		items_cate=6;
		model.addAttribute("etc", "etc");
		}
		
		
		model.addAttribute("userList",dao.userList(items_cate));
		//dao.userList(items_cate)�� �־������
		
		return "userList";
	}
	
	
	
	
	//user ��ǰ �� ��ȸ
	@RequestMapping("user_view")
	public String user_view(@RequestParam("n")int n, Model model) throws Exception{
		itemsDto dto = dao.user_view(n);
		model.addAttribute("user_view", dto);
		
		return "user_view";
		
	}
	/*
	
	//user table list
	@RequestMapping("userTable")
	public String userTable(Model model)throws Exception{
		model.addAttribute("userTable",dao.userTable());
		return "userTable";
	}
		
	//user table ����ȸ
	@RequestMapping("user_table_view")
	public String user_table_view(@RequestParam("n")int n, Model model) throws Exception{
		itemsDto dto = dao.user_table_view(n);
		model.addAttribute("user_table_view", dto);
		return "user_table_view";
	}

	
	//user chair list
	@RequestMapping("userChair")
	public String userChair(Model model)throws Exception{
		model.addAttribute("userChair", dao.userChair());
		return "userChair";
	}

	//user chair ����ȸ
	@RequestMapping("user_chair_view")
	public String user_chair_view(@RequestParam("n")int n,Model model) throws Exception{
		itemsDto dto = dao.user_chair_view(n);
		model.addAttribute("user_chair_view", dto);
		return "user_chair_view";
	}

	//user sofa list
	@RequestMapping("userSofa")
	public String userSofa(Model model)throws Exception{
		model.addAttribute("userSofa", dao.userSofa());
		return "userSofa";
	}
	
	//user sofa ����ȸ
	@RequestMapping("user_sofa_view")
	public String user_sofa_view(@RequestParam("n")int n,Model model) throws Exception{
		itemsDto dto = dao.user_sofa_view(n);
		model.addAttribute("user_sofa_view", dto);
		return "user_sofa_view";
	}
	
	
	
	//user bookshelf list
	@RequestMapping("userBookshelf")
	public String userBookshelf(Model model)throws Exception{
		model.addAttribute("userBookshelf",dao.userBookshelf());
		return "userBookshelf";
	}
	
	//user bookshelf ����ȸ
	@RequestMapping("user_bookshelf_view")
	public String user_bookshelf_view(@RequestParam("n")int n, Model model) throws Exception{
		itemsDto dto = dao.user_bookshelf_view(n);
		model.addAttribute("user_bookshelf_view",dto);
		return "user_bookshelf_view";
		
	}
	
	//user etc list
	@RequestMapping("userEtc")
	public String userEtc(Model model) throws Exception{
		model.addAttribute("userEtc", dao.userEtc());
		return "userEtc";
	}
	
	//user etc ����ȸ
	@RequestMapping("user_etc_view")
	public String user_etc_view(@RequestParam("n")int n, Model model)throws Exception{
		//itemsDto dto = dao.user_etc_view(n);
		model.addAttribute("user_etc_view",dao.user_etc_view(n));
		return "user_etc_view";
		
	}
	
	
*/

}
