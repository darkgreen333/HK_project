package com.lee.ccc.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.lee.ccc.social.NaverLoginBO;

@Controller
public class NaverLoginController {
	
	private NaverLoginBO naverLoginBO;
	
	@RequestMapping(value="naverlogin", method={RequestMethod.GET, RequestMethod.POST})
	public String initLogin(Model model, HttpSession session)throws Exception {
		
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		model.addAttribute("naver_url", naverAuthUrl);
		
		return "naverlogin";
	}
	
	@RequestMapping("naverLoginCallback")
	public String naverCallback(ModelMap model,@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {

		/* �׾Ʒ� ������ ���������� �Ϸ�Ǹ� code �Ķ���Ͱ� ���޵Ǹ� �̸� ���� access token�� �߱� */
	    OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
	    String apiResult = naverLoginBO.getUserProfile(oauthToken);

	    System.out.println("Naver login success");
	    model.addAttribute("result", apiResult);

	    return "main/main.tiles";
	}
}
