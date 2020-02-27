package com.lee.ccc.util;


import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.PlatformTransactionManager;





public class Constant {
	public static JdbcTemplate template;
	public static PlatformTransactionManager transactionManager;
	
	
	/*
	public MemDto login1(String mem_id) {
		String sql = "select MEM_ID, MEM_LEVEL,MEM_PW, MEM_NAME,MEM_PHONE,MEM_ADD1,MEM_ADD2,MEM_EMAIL,MEM_ZIP,MEM_DATE FROM SUP_MEMBER MEM_ID ='"+mem_id+"'";
		return template.queryForObject(sql, new BeanPropertyRowMapper<MemDto>(MemDto.class));
	}
*/
}
