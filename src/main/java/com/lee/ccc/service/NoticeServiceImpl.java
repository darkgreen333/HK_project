package com.lee.ccc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.lee.ccc.dao.NoticeDao;
import com.lee.ccc.dto.NoticeDto;
import com.lee.ccc.dto.NoticeSearchCriteria;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Inject
	private NoticeDao dao;
	
	@Override
	public void noticeRegist(NoticeDto dto) throws Exception {
		dao.noticeCreate(dto);
	}
	
	@Override
	public NoticeDto noticeRead(int n_num) throws Exception {
		return dao.noticeRead(n_num);
	}
	
	@Override
	public void noticeModify(NoticeDto dto) throws Exception {
		dao.noticeUpdate(dto);
	}
	
	@Override
	public void noticeRemove(int n_num) throws Exception {
		dao.noticeDelete(n_num);
	}
	
	@Override
	public List<NoticeDto> noticeListSearch(NoticeSearchCriteria nsc) throws Exception {
		return dao.noticeListSearch(nsc);
	}
	
	@Override
	public int noticeListSearchCount(NoticeSearchCriteria nsc) throws Exception {
		return dao.noticeListSearchCount(nsc);
	}
}
