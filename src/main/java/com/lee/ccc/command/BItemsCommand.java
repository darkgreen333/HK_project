package com.lee.ccc.command;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public class BItemsCommand implements Command {

	@Override
	/*
	create table sup_items ( 10���� �÷�
			items_cate number(4) not null,
			items_code number(10) not null primary key,
			items_name  varchar2(50) not null,
			items_quant number(8) not null,
			items_deli number(8),
			items_price number(10),
			items_image varchar2(500),
			itmes_explain varchar2(4000),
			items_stock number(8),
			items_date  date default sysdate
			items_ex_image varchar2(500) );
			
		��ǰ �з� : <input type="number" style="width:25%"  min=1 max=6 id="iCate" name="iCate" 
	placeholder="1=bed 2=table 3=chair 4=sofa 5=bookshelf 6=etc"><br> <br>
	
	��ǰ �ڵ� : <input type="number" style="width:25%" id="iCode" name="iCode"> <br> <br>
	��ǰ �̸� : <input type="text" style="width:25%"  id="iName" name="iName"><br> <br>
	��ǰ ���� : <input type="number" style="width:25%" id="iQuant" name="iQuant"><br> <br>
	��ǰ ��۷�:<input type="number" style="width:25%"  id="iDeli" name="iDeli"/>�� <br> <br>
	��ǰ ���� : <input type="number" style="width:25%"  id="iPrice" name="iPrice">��<br> <br>
	��ǥ ���� : <input type="file" style="width:25%"  id="iImage" name="iImage"><br> <br>
	��ǰ ��� : <input type="number" style="width:25%"  id="iStock" name="iStock"><br> <br>
	��ǰ ���� : <textarea id="iExplain" name="iExplain" style="width:25%"></textarea>
	<input type="hidden" id="iDate" name="iDate"><br>
	�� ����: <input type="file" style="width:25%"  id="iImage2" name="iImage2">
	
	*/
	public void execute(Model model, HttpServletRequest req) {
		String items_cate = req.getParameter("iCate"); //parsInt�� ����ȯ ���ٰ�
		int i_tems_cate_i = Integer.parseInt("items_cate"); 
		
		String items_code = req.getParameter("iCode");//parsInt�� ����ȯ ���ٰ�
		int i_tems_code_i = Integer.parseInt("items_code");
		
		String items_name = req.getParameter("iName");
		String items_quant = req.getParameter("iQuant");//parsInt�� ����ȯ ���ٰ�
		int i_tems_quant_i = Integer.parseInt("items_quant");
		
		String items_deli = req.getParameter("iDeli");//parsInt�� ����ȯ ���ٰ�
		int i_tems_deli_i = Integer.parseInt("items_deli");
		
		String items_price = req.getParameter("iPrice");//parsInt�� ����ȯ ���ٰ�
		int i_tems_price_i = Integer.parseInt("items_price");
		
		String items_image= req.getParameter("iImage");
		String items_explain = req.getParameter("iExplain");
		String items_stock = req.getParameter("iStock");//parsInt�� ����ȯ ���ٰ�
		int i_tems_stock_i = Integer.parseInt("items_stock");
		
		String items_date = req.getParameter("iDate");

		String items_ex_image = req.getParameter("iImage2");
		
		
		

	}

}
