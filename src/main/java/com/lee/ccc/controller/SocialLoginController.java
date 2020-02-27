package com.lee.ccc.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.github.scribejava.core.model.OAuth2AccessToken;
import com.lee.ccc.social.NaverLoginBO;

@Controller
public class SocialLoginController {
	
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
	@RequestMapping(value = "nlogin", method = { RequestMethod.GET, RequestMethod.POST })
	public void nlogin(Model model, HttpSession session,HttpServletResponse response) throws IOException {
		
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);		
		
		System.out.println("네이버: " + naverAuthUrl);

		response.sendRedirect(naverAuthUrl);
	}
	
	@RequestMapping(value = "glogin", method = { RequestMethod.GET, RequestMethod.POST })
	public void glogin(Model model, HttpSession session,HttpServletResponse response) throws IOException {
		
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String gurl = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		
		System.out.println("구글: " + gurl);

		model.addAttribute("google_url", gurl);

		response.sendRedirect(gurl);
	}
	
	@RequestMapping(value = "callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		System.out.println("callback");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
		model.addAttribute("result", apiResult);
                
		return "naverSuccess";
	}
	
	@RequestMapping(value = "gcallback", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, @RequestParam String code) throws IOException {
		System.out.println("googleCallback");

		return "googleSuccess";
	}
}
