package com.lee.ccc.dao;



import java.util.ArrayList;

import com.lee.ccc.dto.SearchCriteria;
import com.lee.ccc.dto.itemsDto;

public interface ItemsDao {
	
	//----------------  ADMIN  --------------------------------
	
	//��ǰ���
	
	public void register1(itemsDto dto) throws Exception;
	public void register2(itemsDto dto) throws Exception;
	public void register3(itemsDto dto) throws Exception;
	public void register4(itemsDto dto) throws Exception;
	public void register5(itemsDto dto) throws Exception;
	public void register6(itemsDto dto) throws Exception;
	
	//��ǰ���--����¡ó���� ���ؼ�()�ȿ� dto�� ����-(itemsDto����int page, int perPageNum, int rowStart, int rowEnd)
	//�׷��� �˻� ��� ������ �ؾ��ϴ� ��ӹ��� SearchCriteria scrif�� ��
	public ArrayList<itemsDto> register_list(SearchCriteria scri) throws Exception;
	
	//��ǰ��� �Խù� �� ����--����¡ó�� ī��Ʈ
	public int listCount(SearchCriteria scri) throws Exception;
	
	
	//��ǰ �� ��ȸ
	public itemsDto register_retrieve(int items_code);

	//��ǰ ����
	public void register_modify(itemsDto dto) throws Exception;
	
	//��ǰ ����
	public void register_delete(int items_code) throws Exception;

	
	
	
	// ---------------------  USER  ----------------------------
	
	

	//user list
	public ArrayList<itemsDto> userList(int items_cate) throws Exception;
	
	//user �� ��ȸ (user_bed_view)
	public itemsDto user_view(int items_code) throws Exception;

	/*
	//user table list
	public ArrayList<itemsDto> userTable() throws Exception;
	
	//user table ����ȸ
	public itemsDto user_table_view(int items_code) throws Exception;
	
	
	//user chair list
	public ArrayList<itemsDto> userChair() throws Exception;
	
	//user chair �� ��ȸ
	public itemsDto user_chair_view(int items_code) throws Exception;
	
	
	//user sofa list
	public ArrayList<itemsDto> userSofa()throws Exception;
	
	//user sofa ����ȸ
	public itemsDto user_sofa_view(int items_code) throws Exception;
	
	
	//user bookshelf list
	public ArrayList<itemsDto> userBookshelf()throws Exception;
	
	//user bookshelf ����ȸ
	public itemsDto user_bookshelf_view(int items_code) throws Exception;
	
	
	//user etc list
	public ArrayList<itemsDto> userEtc()throws Exception;
	
	//user etc �� ��ȸ
	public itemsDto user_etc_view(int items_code) throws Exception;
	
	*/
	

	
	
}

