package com.lee.ccc.dto;

public class NoticeSearchCriteria extends NoticePageVO {
	private String noticeSearchType;
	private String noticeKeyword;
	
	public NoticeSearchCriteria() {
		
	}
	
	public NoticeSearchCriteria(String noticeSearchType, String noticeKeyword) {
		super();
		this.noticeSearchType = noticeSearchType;
		this.noticeKeyword = noticeKeyword;
	}

	public String getNoticeSearchType() {
		return noticeSearchType;
	}

	public void setNoticeSearchType(String noticeSearchType) {
		this.noticeSearchType = noticeSearchType;
	}

	public String getNoticeKeyword() {
		return noticeKeyword;
	}

	public void setNoticeKeyword(String noticeKeyword) {
		this.noticeKeyword = noticeKeyword;
	}

	@Override
	public String toString() {
		return "NoticeSearchCriteria [noticeSearchType=" + noticeSearchType + ", noticeKeyword=" + noticeKeyword + "]";
	}
}
