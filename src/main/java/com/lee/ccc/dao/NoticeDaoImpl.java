package com.lee.ccc.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lee.ccc.dto.NoticeDto;
import com.lee.ccc.dto.NoticeSearchCriteria;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	@Inject
	private SqlSession session;
	private static String namespace = "com.lee.ccc.NoticeMapper";
	
	@Override
	public void noticeCreate(NoticeDto dto) throws Exception {
		session.insert(namespace + ".noticeCreate", dto);
	}
	
	@Override
	public NoticeDto noticeRead(int n_num) throws Exception {
		NoticeDto dto = session.selectOne("noticeRead", n_num);
		return dto;
	} //사용안함
	
	@Override
	public void noticeUpdate(NoticeDto dto) throws Exception {
		session.update(namespace + ".noticeUpdate", dto);
	}
	
	@Override
	public void noticeDelete(int n_num) throws Exception {
		session.delete(namespace + ".noticeDelete", n_num);
	}
	
	@Override
	public List<NoticeDto> noticeListSearch(NoticeSearchCriteria nsc) throws Exception {
		return session.selectList(namespace + ".noticeListSearch", nsc);
	}
	
	@Override
	public int noticeListSearchCount(NoticeSearchCriteria nsc) throws Exception {
		return session.selectOne(namespace + ".noticeListSearchCount", nsc);
	}
}
