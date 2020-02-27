package com.lee.ccc.service;

import java.util.List;

import com.lee.ccc.dto.NoticeDto;
import com.lee.ccc.dto.NoticeSearchCriteria;

public interface NoticeService {
	public void noticeRegist(NoticeDto dto) throws Exception;
	public NoticeDto noticeRead(int n_num) throws Exception;
	public void noticeModify(NoticeDto dto) throws Exception;
	public void noticeRemove(int n_num) throws Exception;
	public List<NoticeDto> noticeListSearch(NoticeSearchCriteria nsc) throws Exception;
	public int noticeListSearchCount(NoticeSearchCriteria nsc) throws Exception;
}
