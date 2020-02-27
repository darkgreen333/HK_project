package com.lee.ccc.dto;


//itemsDto를  extends함. SearchCriteria로 itemsDto의 페이징기능 사용할수 있다
public class SearchCriteria extends itemsDto{
	
	private String searchType = "";
	private String keyword = "";
	
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}

}
