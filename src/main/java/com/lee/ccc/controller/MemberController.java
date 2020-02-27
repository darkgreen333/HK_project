package com.lee.ccc.controller;


import java.io.PrintWriter;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.lee.ccc.command.MemberCommand;
import com.lee.ccc.dto.MemberDto;
import com.lee.ccc.dto.UserDto;


@Controller
public class MemberController {
	
	@Autowired
	private MemberCommand com;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	@RequestMapping(value = "signUp", method = RequestMethod.POST)
	public String signUp(MemberDto dto) { //회원가입
		String pw = dto.getMemPw();
		String bpw = pwdEncoder.encode(pw);
		dto.setMemPw(bpw);
		com.signUp(dto);
		return "home";
	}
	
	@RequestMapping("login_view")
	public String login_view() { //로그인 페이지
		return "login_view";
	}
	
	@RequestMapping("logout")
	public String logout() { //로그아웃
		return "home";
	}
	
	@RequestMapping(value = "idCheck", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String idCheck(HttpServletRequest req) { //아이디 중복 확인
		String memId = req.getParameter("memId");
		int result = com.idCheck(memId);
		return Integer.toString(result);
	}
	
	@RequestMapping("pwSearch")
	public String pwSearch() { //비번찾기 페이지
		return "pw_search";
	}
	
	@RequestMapping(value = "pwSearchOk", method = RequestMethod.POST)
    public ModelAndView find_pass(HttpServletRequest request, String memId, String memEmail,
            HttpServletResponse response_email) throws Exception{
        
        //랜덤한 난수 (인증번호)를 생성해서 이메일로 보내고 그 인증번호를 입력하면 비밀번호를 변경할 수 있는 페이지로 이동시킴
        
        Random r = new Random();
        int dice = r.nextInt(157211)+48271;
        
        String setfrom = "iamkgh12@gmail.com";
        String tomail = request.getParameter("memEmail");    //받는 사람의 이메일
        String title = "비밀번호 찾기 인증 이메일 입니다.";    //제목
        String content =
                System.getProperty("line.separator")+
                
                System.getProperty("line.separator")+
                        
                "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
                
                +System.getProperty("line.separator")+
                
                System.getProperty("line.separator")+
        
                "비밀번호 찾기 인증번호는 " +dice+ " 입니다. "
                
                +System.getProperty("line.separator")+
                
                System.getProperty("line.separator")+
                
                "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
    
        	} catch (Exception e) {
            System.out.println(e);
        	}
        
        ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
        mv.setViewName("pass_email");     //뷰의이름
        mv.addObject("dice", dice);
        mv.addObject("memEmail", memEmail);
        
        System.out.println("mv : "+mv);

        response_email.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response_email.getWriter();
        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
        out_email.flush();
             
        return mv;
        
    }
   
    //인증번호를 입력한 후에 확인 버튼을 누르면 자료가 넘어오는 컨트롤러
    @RequestMapping(value = "pass_injeung{dice},{memEmail:.+}", method = RequestMethod.POST)
    public ModelAndView pass_injeung(String pass_injeung, @PathVariable String dice, @PathVariable String memEmail, 
    		HttpServletResponse response_equals) throws Exception{
        
        System.out.println("마지막 : pass_injeung : "+pass_injeung);
        
        System.out.println("마지막 : dice : "+dice);
        
        ModelAndView mv = new ModelAndView();
        
        mv.setViewName("pass_change");
        
        mv.addObject("memEmail",memEmail);
        
        if (pass_injeung.equals(dice)) {
            
            //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 비밀번호 변경창으로 이동시킨다
        
            mv.setViewName("pass_change");
            
            mv.addObject("memEmail",memEmail);
            
            //만약 인증번호가 같다면 이메일을 비밀번호 변경 페이지로 넘기고, 활용할 수 있도록 한다.
            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('인증번호가 일치하였습니다. 비밀번호 변경창으로 이동합니다.');</script>");
            out_equals.flush();
    
            return mv;
            
        }else if (pass_injeung != dice) {
            
            ModelAndView mv2 = new ModelAndView(); 
            
            mv2.setViewName("pass_email");
            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
            out_equals.flush();
            
            return mv2;
        }    
    
        return mv;
    }
    
    //변경할 비밀번호를 입력한 후에 확인 버튼을 누르면 넘어오는 컨트롤러
    @RequestMapping(value = "pass_change{memEmail:.+}", method = RequestMethod.POST)
    public ModelAndView pass_change(@PathVariable String memEmail, HttpServletRequest request, MemberDto dto, HttpServletResponse pass) throws Exception{
                
	    String memPw = request.getParameter("memPw");
	                
	    String memEmail1 = memEmail;
	                
	    dto.setMemEmail(memEmail1);
	    dto.setMemPw(pwdEncoder.encode(memPw));
	    
	    //값을 여러개 담아야 하므로 해쉬맵을 사용해서 값을 저장함
	    
	    Map<String, Object> map = new HashMap<>();
	    
	    map.put("memEmail", dto.getMemEmail());
	    map.put("memPw", dto.getMemPw());
	    
	    com.pass_change(map,dto);
	    
	    ModelAndView mv = new ModelAndView();
	    
	    mv.setViewName("find_pass_result");
	    
	    return mv;    
    }
    
    @RequestMapping("memberModify") 
	public String memberModify(Principal principal, Model model) { //회원정보
    	String memId = principal.getName();
    	model.addAttribute("user", com.memberModify(memId));
		return "memberModify";
	}
    
    @RequestMapping("memberUpdate") 
    public String memberUpdate(@ModelAttribute MemberDto dto) { //마이페이지 회원정보수정
    	com.memberUpdate(dto);
    	return "myPage";
    }
    
    
    @ResponseBody 
    @RequestMapping(value="pwCheck", method={RequestMethod.GET, RequestMethod.POST})
    public boolean pwCheck(MemberDto dto) { //비밀번호 체크
    	boolean result = com.pwCheck(dto);
    	return result;
    }
    
    @RequestMapping(value="memberDelete_view", method=RequestMethod.GET)
    public String memberDelete_view() { //회원탈퇴 페이지
    	return "memberDelete_view";
    }
    
    @RequestMapping("memberDelete")
    public String memberDelete(MemberDto dto) { //마이페이지 회원탈퇴
    	UserDto user = (UserDto) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	dto.setMemPw(user.getPassword());
    	com.memberDelete(dto);
    	SecurityContextHolder.clearContext();
    	return "redirect:/logout";
    }
    
    @RequestMapping("memberPwChange_view")
    public String memberPwChange_view() { //비밀번호변경 페이지
    	return "memberPwChange_view";
    }
    
    @RequestMapping("memberPwChange")
    public String memberPwChange(Principal principal,MemberDto dto) { //마이페이지 비밀번호변경
    	dto.setMemId(principal.getName());
    	dto.setMemPw(pwdEncoder.encode(dto.getMemPw()));
    	com.memberPwChange(dto);
    	SecurityContextHolder.clearContext();
    	return "redirect:/logout";
    }
    
    @RequestMapping("orderList_view")
    public String orderList_view(Principal principal,Model model) { //주문내역확인 페이지
    	String memId = principal.getName();
    	model.addAttribute("user", com.orderList(memId));
    	return "orderList_view";
    }
}
