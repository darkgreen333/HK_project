package com.lee.ccc.dto;


import java.util.ArrayList;
import java.util.Collection;


import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@SuppressWarnings("serial")
public class UserDto implements UserDetails{
	
	private String id;
	private String password;
	private String name;
	private String authorities;
	private boolean enabled;
	
	public UserDto() {
		
	}
	
	public UserDto(String id, String password, String name, String authorities) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.authorities = authorities;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority(authorities));
        return auth;
    }

	
	@Override
	public String getPassword() {
		return password;
	}
	
	@Override
	public String getUsername() {
		return getId();
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	
	@Override
	public boolean isEnabled() {
		return true;
	}
	
}
