package com.lee.ccc.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class NoticePageMaker {
	private int noticeTotalCount;
	private int noticeStartPage;
	private int noticeEndPage;
	private boolean noticePrev;
	private boolean noticeNext;
	
	private int noticeDisplayPageNum = 10;
	
	private NoticePageVO npvo;

	public int getNoticeTotalCount() {
		return noticeTotalCount;
	}

	public void setNoticeTotalCount(int noticeTotalCount) {
		this.noticeTotalCount = noticeTotalCount;
		
		noticeCalcDate();
	}
	
	private void noticeCalcDate() {
		noticeEndPage = (int)(Math.ceil(npvo.getNoticePage()/(double)noticeDisplayPageNum)*noticeDisplayPageNum);
		noticeStartPage = (noticeEndPage - noticeDisplayPageNum) + 1;
		
		int noticeTempEndPage = (int)(Math.ceil(noticeTotalCount/(double)npvo.getNoticePerPageNum()));
		
		if(noticeEndPage > noticeTempEndPage) {
			noticeEndPage = noticeTempEndPage;
		}
		
		noticePrev = noticeStartPage == 1 ? false : true;
		
		noticeNext = noticeEndPage * npvo.getNoticePerPageNum() >= noticeTotalCount ? false : true;
	}
	
	public String noticeMakeQuery(int noticePage) {
		UriComponents uc = UriComponentsBuilder.newInstance()
				.queryParam("noticePage", noticePage)
				.queryParam("noticePerPageNum", npvo.getNoticePerPageNum())
				.build();
		return uc.toUriString();
	}
	
	public String noticeMakeSearch(int noticePage) {
		UriComponents uc = UriComponentsBuilder.newInstance()
				.queryParam("noticePage", noticePage)
				.queryParam("noticePerPageNum", npvo.getNoticePerPageNum())
				.queryParam("noticeSearchType", ((NoticeSearchCriteria)npvo).getNoticeSearchType())
				.queryParam("noticeKeyword", noticeEncoding(((NoticeSearchCriteria)npvo).getNoticeKeyword()))
				.build();
		return uc.toUriString();
	}
	
	private String noticeEncoding(String noticeKeyword) {
		if(noticeKeyword == null || noticeKeyword.trim().length() == 0) {
			return "";
		}
		try {
			return URLEncoder.encode(noticeKeyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}
	
	public int getNoticeStartPage() {
		return noticeStartPage;
	}

	public void setNoticeStartPage(int noticeStartPage) {
		this.noticeStartPage = noticeStartPage;
	}

	public int getNoticeEndPage() {
		return noticeEndPage;
	}

	public void setNoticeEndPage(int noticeEndPage) {
		this.noticeEndPage = noticeEndPage;
	}

	public boolean isNoticePrev() {
		return noticePrev;
	}

	public void setNoticePrev(boolean noticePrev) {
		this.noticePrev = noticePrev;
	}

	public boolean isNoticeNext() {
		return noticeNext;
	}

	public void setNoticeNext(boolean noticeNext) {
		this.noticeNext = noticeNext;
	}

	public int getNoticeDisplayPageNum() {
		return noticeDisplayPageNum;
	}

	public void setNoticeDisplayPageNum(int noticeDisplayPageNum) {
		this.noticeDisplayPageNum = noticeDisplayPageNum;
	}

	public NoticePageVO getNpvo() {
		return npvo;
	}

	public void setNpvo(NoticePageVO npvo) {
		this.npvo = npvo;
	}

	@Override
	public String toString() {
		return "NoticePageMaker [noticeTotalCount=" + noticeTotalCount + ", noticeStartPage=" + noticeStartPage
				+ ", noticeEndPage=" + noticeEndPage + ", noticePrev=" + noticePrev + ", noticeNext=" + noticeNext
				+ ", noticeDisplayPageNum=" + noticeDisplayPageNum + ", npvo=" + npvo + "]";
	}
	
	
}
