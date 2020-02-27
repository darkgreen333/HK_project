package com.lee.ccc.dao;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lee.ccc.dto.SearchCriteria;
import com.lee.ccc.dto.itemsDto;


@Repository
public class IDao implements ItemsDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public IDao() {
		
	}
	
	//��ǰ���
	
	@Override
	public void register1(itemsDto dto) {
		/*
		int items_cate = dto.getItems_cate();
		int items_code = dto.getItems_code();
		String items_name = dto.getItems_name();
		int itmes_quant = dto.getItems_quant();
		int items_deli = dto.getItems_deli();
		int intes_price =dto.getItems_price();
		String items_image = dto.getItems_image();
		String items_explain = dto.getItems_explain();
		int items_stock = dto.getItems_stock();
		Timestamp items_date = dto.getItems_date();
		String items_ex_image = dto.getItems_ex_image();
		
		int result;
		String sql = "insert into sup_items (itmes_cate,itmes_code,items_name,items_quant,itmes_deli,itmes_price,items_image,itmes_explain,items_stock,itmes_date,items_ex_image)"
				+ "values(?,SUP_ITEMS_SEQ.NEXTVAL,?,?,?,?,?,?,?,null,?)";*/
		
		
		
		sqlSession.insert("register1",dto);
	}

	

	@Override
	public void register2(itemsDto dto) {
		sqlSession.insert("register2",dto);
	}
	@Override
	public void register3(itemsDto dto) {
		sqlSession.insert("register3",dto);
	}
	@Override
	public void register4(itemsDto dto) {
		sqlSession.insert("register4",dto);
	}
	@Override
	public void register5(itemsDto dto) {
		sqlSession.insert("register5",dto);
	}
	@Override
	public void register6(itemsDto dto) {
		sqlSession.insert("register6",dto);
	}
	
	
	
	//��ǰ ���
	@Override
	public ArrayList<itemsDto> register_list(SearchCriteria scri) throws Exception {
		ArrayList<itemsDto> result = (ArrayList) sqlSession.selectList("register_list",scri);//�Ķ���� ����dto�� �޾����ϱ�
		//select("xml�� id��")�� �������� ����Ʈ ��ȯ�� ���
		return result;
	}
	
	//��ǰ ��� �Խù� �� ����-����¡ó��
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectOne("listCount",scri);
	}
	
	
	
	//��ǰ �� ��ȸ
	@Override
	public itemsDto register_retrieve(int items_code) {
		return sqlSession.selectOne("register_retrieve",items_code);
		
	}
	
	
	//��ǰ ����
	@Override
	public void register_modify(itemsDto dto) throws Exception {
		sqlSession.update("register_modify",dto);
		
	}
	
	//��ǰ ����
	@Override
	public void register_delete(int items_code) {
		sqlSession.delete("register_delete",items_code);
	}

	//--------------------  USER  ---------------------------
	

	//user list
	@Override
	public ArrayList<itemsDto> userList(int items_cate) throws Exception {
		ArrayList<itemsDto> result = (ArrayList) sqlSession.selectList("userList",items_cate);
		return result;
		
	}

	//user ��ǰ �� ��ȸ (user_bed_view)
	@Override
	public itemsDto user_view(int items_code) throws Exception {
		return sqlSession.selectOne("user_view", items_code);
	}



	
	
	
	
	
	//�ֹ�

	


	

	/*
	
	//user table list
	@Override
	public ArrayList<itemsDto> userTable() throws Exception {
		ArrayList<itemsDto> result = (ArrayList) sqlSession.selectList("userTable");
		return result;
	}

	//user table ����ȸ
	@Override
	public itemsDto user_table_view(int items_code) throws Exception {
		return sqlSession.selectOne("user_table_view", items_code);
	}

	//user chair list
	@Override
	public ArrayList<itemsDto> userChair() throws Exception {
		ArrayList<itemsDto> result = (ArrayList) sqlSession.selectList("userChair");
		return result;
	}

	//user chair ����ȸ
	@Override
	public itemsDto user_chair_view(int items_code) throws Exception {
		return sqlSession.selectOne("user_chair_view", items_code);
	}

	//user sofa list
	@Override
	public ArrayList<itemsDto> userSofa() throws Exception {
		ArrayList<itemsDto> result = (ArrayList) sqlSession.selectList("userSofa");
		return result;
	}

	//user sofa ����ȸ
	@Override
	public itemsDto user_sofa_view(int items_code) throws Exception {
		return sqlSession.selectOne("user_sofa_view", items_code);
	}

	//user Bookshelf list
	@Override
	public ArrayList<itemsDto> userBookshelf() throws Exception {
		ArrayList<itemsDto> result = (ArrayList) sqlSession.selectList("userBookshelf");
		return result;
	}

	//user bookshelf ����ȸ
	@Override
	public itemsDto user_bookshelf_view(int items_code) throws Exception {
		return sqlSession.selectOne("user_bookshelf_view", items_code);
	}

	//user etc list
	@Override
	public ArrayList<itemsDto> userEtc() throws Exception {
		ArrayList<itemsDto> result = (ArrayList) sqlSession.selectList("userEtc");
		return result;
	}

	//user etc ����ȸ
	@Override
	public itemsDto user_etc_view(int items_code) throws Exception {
		return sqlSession.selectOne("user_etc_view", items_code);
	}
	
	
	*/
	

	
	//============================ cart ================================
	

	
	

	/*cart list
	@Override
	public ArrayList<itemsDto> cart_list() throws Exception {
		ArrayList<itemsDto> result = (ArrayList) sqlSession.selectList("cart_list");
		return result;
	}*/
		

	
	

	


	

}
