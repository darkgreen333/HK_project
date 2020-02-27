package com.lee.ccc.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;


import com.lee.ccc.dao.MemberDao;
import com.lee.ccc.dto.UserDto;

public class CustomUserDetailsService implements UserDetailsService{
	 
	 	@Autowired
	    private MemberDao dao;
	 	
	    @Override
	    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	    	System.out.println("loadUserByUsername() 호출");
	    	UserDto user = null;
	    	user = dao.getUserById(username);
	        if(user==null) {
	            throw new UsernameNotFoundException("해당 사용자를 찾지 못했습니다");
	        }
	        return user;
	    }


}