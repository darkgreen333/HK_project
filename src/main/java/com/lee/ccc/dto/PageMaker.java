package com.lee.ccc.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker { //페이징 처리를 위한 DTO
	
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 10;
	private itemsDto dto;
	
	
	
	public itemsDto getDto() {
		return dto;
	}

	public void setDto(itemsDto dto) {
		this.dto = dto;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public boolean isPrev() {
		return prev;
	}
	
	public boolean isNext() {
		return next;
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	
	
	 
	private void calcData() {
		endPage = (int) (Math.ceil(dto.getPage() / (double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
	  
		int tempEndPage = (int) (Math.ceil(totalCount / (double)dto.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * dto.getPerPageNum() >= totalCount ? false : true;
	}
	
	public String makeQuery(int page) {
		UriComponents uriComponents =
		UriComponentsBuilder.newInstance()
						    .queryParam("page", page)
							.queryParam("perPageNum", dto.getPerPageNum())
							.build();
		   
		return uriComponents.toUriString();
	}
	
	
	
	//검색 기능 추가
	 
	public String makeSearch(int page)
		{
		  
		 UriComponents uriComponents =
		            UriComponentsBuilder.newInstance()
		            .queryParam("page", page)
		            .queryParam("perPageNum", dto.getPerPageNum())
		            .queryParam("searchType", ((SearchCriteria)dto).getSearchType())
		            .queryParam("keyword", encoding(((SearchCriteria)dto).getKeyword()))
		            .build(); 
		    return uriComponents.toUriString();  
		}

		private String encoding(String keyword) {
			if(keyword == null || keyword.trim().length() == 0) { 
				return "";
			}
			 
			try {
				return URLEncoder.encode(keyword, "UTF-8");
			} catch(UnsupportedEncodingException e) { 
				return ""; 
			}
		}
}
