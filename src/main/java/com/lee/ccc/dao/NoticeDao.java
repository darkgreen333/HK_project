package com.lee.ccc.dao;

import java.util.List;

import com.lee.ccc.dto.NoticeDto;
import com.lee.ccc.dto.NoticeSearchCriteria;

public interface NoticeDao {
	public void noticeCreate(NoticeDto dto) throws Exception;
	public NoticeDto noticeRead(int n_num) throws Exception;
	public void noticeUpdate(NoticeDto dto) throws Exception;
	public void noticeDelete(int n_num) throws Exception;
	public List<NoticeDto> noticeListSearch(NoticeSearchCriteria nsc) throws Exception;
	public int noticeListSearchCount(NoticeSearchCriteria nsc) throws Exception;
}
