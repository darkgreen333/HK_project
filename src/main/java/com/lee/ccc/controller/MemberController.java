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
	public String signUp(MemberDto dto) { //ȸ������
		String pw = dto.getMemPw();
		String bpw = pwdEncoder.encode(pw);
		dto.setMemPw(bpw);
		com.signUp(dto);
		return "home";
	}
	
	@RequestMapping("login_view")
	public String login_view() { //�α��� ������
		return "login_view";
	}
	
	@RequestMapping("logout")
	public String logout() { //�α׾ƿ�
		return "home";
	}
	
	@RequestMapping(value = "idCheck", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String idCheck(HttpServletRequest req) { //���̵� �ߺ� Ȯ��
		String memId = req.getParameter("memId");
		int result = com.idCheck(memId);
		return Integer.toString(result);
	}
	
	@RequestMapping("pwSearch")
	public String pwSearch() { //���ã�� ������
		return "pw_search";
	}
	
	@RequestMapping(value = "pwSearchOk", method = RequestMethod.POST)
    public ModelAndView find_pass(HttpServletRequest request, String memId, String memEmail,
            HttpServletResponse response_email) throws Exception{
        
        //������ ���� (������ȣ)�� �����ؼ� �̸��Ϸ� ������ �� ������ȣ�� �Է��ϸ� ��й�ȣ�� ������ �� �ִ� �������� �̵���Ŵ
        
        Random r = new Random();
        int dice = r.nextInt(157211)+48271;
        
        String setfrom = "iamkgh12@gmail.com";
        String tomail = request.getParameter("memEmail");    //�޴� ����� �̸���
        String title = "��й�ȣ ã�� ���� �̸��� �Դϴ�.";    //����
        String content =
                System.getProperty("line.separator")+
                
                System.getProperty("line.separator")+
                        
                "�ȳ��ϼ��� ȸ���� ���� Ȩ�������� ã���ּż� �����մϴ�"
                
                +System.getProperty("line.separator")+
                
                System.getProperty("line.separator")+
        
                "��й�ȣ ã�� ������ȣ�� " +dice+ " �Դϴ�. "
                
                +System.getProperty("line.separator")+
                
                System.getProperty("line.separator")+
                
                "������ ������ȣ�� Ȩ�������� �Է��� �ֽø� �������� �Ѿ�ϴ�."; // ����
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

            messageHelper.setFrom(setfrom); // �����»�� �����ϸ� �����۵��� ����
            messageHelper.setTo(tomail); // �޴»�� �̸���
            messageHelper.setSubject(title); // ���������� ������ �����ϴ�
            messageHelper.setText(content); // ���� ����
            
            mailSender.send(message);
    
        	} catch (Exception e) {
            System.out.println(e);
        	}
        
        ModelAndView mv = new ModelAndView();    //ModelAndView�� ���� �������� �����ϰ�, ���� ���� �����Ѵ�.
        mv.setViewName("pass_email");     //�����̸�
        mv.addObject("dice", dice);
        mv.addObject("memEmail", memEmail);
        
        System.out.println("mv : "+mv);

        response_email.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response_email.getWriter();
        out_email.println("<script>alert('�̸����� �߼۵Ǿ����ϴ�. ������ȣ�� �Է����ּ���.');</script>");
        out_email.flush();
             
        return mv;
        
    }
   
    //������ȣ�� �Է��� �Ŀ� Ȯ�� ��ư�� ������ �ڷᰡ �Ѿ���� ��Ʈ�ѷ�
    @RequestMapping(value = "pass_injeung{dice},{memEmail:.+}", method = RequestMethod.POST)
    public ModelAndView pass_injeung(String pass_injeung, @PathVariable String dice, @PathVariable String memEmail, 
    		HttpServletResponse response_equals) throws Exception{
        
        System.out.println("������ : pass_injeung : "+pass_injeung);
        
        System.out.println("������ : dice : "+dice);
        
        ModelAndView mv = new ModelAndView();
        
        mv.setViewName("pass_change");
        
        mv.addObject("memEmail",memEmail);
        
        if (pass_injeung.equals(dice)) {
            
            //������ȣ�� ��ġ�� ��� ������ȣ�� �´ٴ� â�� ����ϰ� ��й�ȣ ����â���� �̵���Ų��
        
            mv.setViewName("pass_change");
            
            mv.addObject("memEmail",memEmail);
            
            //���� ������ȣ�� ���ٸ� �̸����� ��й�ȣ ���� �������� �ѱ��, Ȱ���� �� �ֵ��� �Ѵ�.
            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('������ȣ�� ��ġ�Ͽ����ϴ�. ��й�ȣ ����â���� �̵��մϴ�.');</script>");
            out_equals.flush();
    
            return mv;
            
        }else if (pass_injeung != dice) {
            
            ModelAndView mv2 = new ModelAndView(); 
            
            mv2.setViewName("pass_email");
            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('������ȣ�� ��ġ�����ʽ��ϴ�. ������ȣ�� �ٽ� �Է����ּ���.'); history.go(-1);</script>");
            out_equals.flush();
            
            return mv2;
        }    
    
        return mv;
    }
    
    //������ ��й�ȣ�� �Է��� �Ŀ� Ȯ�� ��ư�� ������ �Ѿ���� ��Ʈ�ѷ�
    @RequestMapping(value = "pass_change{memEmail:.+}", method = RequestMethod.POST)
    public ModelAndView pass_change(@PathVariable String memEmail, HttpServletRequest request, MemberDto dto, HttpServletResponse pass) throws Exception{
                
	    String memPw = request.getParameter("memPw");
	                
	    String memEmail1 = memEmail;
	                
	    dto.setMemEmail(memEmail1);
	    dto.setMemPw(pwdEncoder.encode(memPw));
	    
	    //���� ������ ��ƾ� �ϹǷ� �ؽ����� ����ؼ� ���� ������
	    
	    Map<String, Object> map = new HashMap<>();
	    
	    map.put("memEmail", dto.getMemEmail());
	    map.put("memPw", dto.getMemPw());
	    
	    com.pass_change(map,dto);
	    
	    ModelAndView mv = new ModelAndView();
	    
	    mv.setViewName("find_pass_result");
	    
	    return mv;    
    }
    
    @RequestMapping("memberModify") 
	public String memberModify(Principal principal, Model model) { //ȸ������
    	String memId = principal.getName();
    	model.addAttribute("user", com.memberModify(memId));
		return "memberModify";
	}
    
    @RequestMapping("memberUpdate") 
    public String memberUpdate(@ModelAttribute MemberDto dto) { //���������� ȸ����������
    	com.memberUpdate(dto);
    	return "myPage";
    }
    
    
    @ResponseBody 
    @RequestMapping(value="pwCheck", method={RequestMethod.GET, RequestMethod.POST})
    public boolean pwCheck(MemberDto dto) { //��й�ȣ üũ
    	boolean result = com.pwCheck(dto);
    	return result;
    }
    
    @RequestMapping(value="memberDelete_view", method=RequestMethod.GET)
    public String memberDelete_view() { //ȸ��Ż�� ������
    	return "memberDelete_view";
    }
    
    @RequestMapping("memberDelete")
    public String memberDelete(MemberDto dto) { //���������� ȸ��Ż��
    	UserDto user = (UserDto) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	dto.setMemPw(user.getPassword());
    	com.memberDelete(dto);
    	SecurityContextHolder.clearContext();
    	return "redirect:/logout";
    }
    
    @RequestMapping("memberPwChange_view")
    public String memberPwChange_view() { //��й�ȣ���� ������
    	return "memberPwChange_view";
    }
    
    @RequestMapping("memberPwChange")
    public String memberPwChange(Principal principal,MemberDto dto) { //���������� ��й�ȣ����
    	dto.setMemId(principal.getName());
    	dto.setMemPw(pwdEncoder.encode(dto.getMemPw()));
    	com.memberPwChange(dto);
    	SecurityContextHolder.clearContext();
    	return "redirect:/logout";
    }
    
    @RequestMapping("orderList_view")
    public String orderList_view(Principal principal,Model model) { //�ֹ�����Ȯ�� ������
    	String memId = principal.getName();
    	model.addAttribute("user", com.orderList(memId));
    	return "orderList_view";
    }
}
