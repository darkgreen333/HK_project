package com.lee.ccc.dao;



import java.util.ArrayList;

import com.lee.ccc.dto.SearchCriteria;
import com.lee.ccc.dto.itemsDto;

public interface ItemsDao {
	
	//----------------  ADMIN  --------------------------------
	
	//상품등록
	
	public void register1(itemsDto dto) throws Exception;
	public void register2(itemsDto dto) throws Exception;
	public void register3(itemsDto dto) throws Exception;
	public void register4(itemsDto dto) throws Exception;
	public void register5(itemsDto dto) throws Exception;
	public void register6(itemsDto dto) throws Exception;
	
	//상품목록--페이징처리를 위해서()안에 dto값 받음-(itemsDto에서int page, int perPageNum, int rowStart, int rowEnd)
	//그러나 검색 기능 구현을 해야하니 상속받은 SearchCriteria scrif를 씀
	public ArrayList<itemsDto> register_list(SearchCriteria scri) throws Exception;
	
	//상품목록 게시물 총 개수--페이징처리 카운트
	public int listCount(SearchCriteria scri) throws Exception;
	
	
	//상품 상세 조회
	public itemsDto register_retrieve(int items_code);

	//상품 수정
	public void register_modify(itemsDto dto) throws Exception;
	
	//상품 삭제
	public void register_delete(int items_code) throws Exception;

	
	
	
	// ---------------------  USER  ----------------------------
	
	

	//user list
	public ArrayList<itemsDto> userList(int items_cate) throws Exception;
	
	//user 상세 조회 (user_bed_view)
	public itemsDto user_view(int items_code) throws Exception;

	/*
	//user table list
	public ArrayList<itemsDto> userTable() throws Exception;
	
	//user table 상세조회
	public itemsDto user_table_view(int items_code) throws Exception;
	
	
	//user chair list
	public ArrayList<itemsDto> userChair() throws Exception;
	
	//user chair 상세 조회
	public itemsDto user_chair_view(int items_code) throws Exception;
	
	
	//user sofa list
	public ArrayList<itemsDto> userSofa()throws Exception;
	
	//user sofa 상세조회
	public itemsDto user_sofa_view(int items_code) throws Exception;
	
	
	//user bookshelf list
	public ArrayList<itemsDto> userBookshelf()throws Exception;
	
	//user bookshelf 상세조회
	public itemsDto user_bookshelf_view(int items_code) throws Exception;
	
	
	//user etc list
	public ArrayList<itemsDto> userEtc()throws Exception;
	
	//user etc 상세 조회
	public itemsDto user_etc_view(int items_code) throws Exception;
	
	*/
	

	
	
}

