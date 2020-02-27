package com.lee.ccc.dto;

public class NoticePageVO {
	private int noticePage;
	private int noticePerPageNum;
	
	public NoticePageVO() {
		this.noticePage = 1;
		this.noticePerPageNum = 10;
	}

	public int getNoticePage() {
		return noticePage;
	}

	public void setNoticePage(int noticePage) {
		if(noticePage <= 0 ) {
			this.noticePage = 1;
			return;
		}
		this.noticePage = noticePage;
	}

	public int getNoticePerPageNum() {
		return noticePerPageNum;
	}

	public void setNoticePerPageNum(int noticePerPageNum) {
		if(noticePerPageNum <= 0 || noticePerPageNum > 100) {
			this.noticePerPageNum = 10;
			return;
		}
		this.noticePerPageNum = noticePerPageNum;
	}
	
	public int getNoticePageStart() {
		return (this.noticePage-1) * noticePerPageNum;
	}

	@Override
	public String toString() {
		return "NoticePageVO [noticePage=" + noticePage + ", noticePerPageNum=" + noticePerPageNum + "]";
	}
	
	
	
}
