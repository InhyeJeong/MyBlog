package edu.iot.myblog.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.iot.common.exception.LoginFailException;
import edu.iot.common.model.Login;
import edu.iot.common.model.LoginMember;
import edu.iot.common.service.LoginMemberService;

@Controller
@RequestMapping("/account")
public class LoginMemberController {
	@Autowired
	LoginMemberService service;
	
	/**로그인 모델 추가 후, 인터셉터를 이용한 로그인 처리*/
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm(Login login,
						@ModelAttribute("url") String url,
						@ModelAttribute("reason") String reason){
		login.setUrl(url);
		login.setReason(reason);
		return "account/login";
	}
		
	/**로그인 모델 추가 후, 인터셉터를 이용한 로그인 처리*/
	@RequestMapping(value="/login", method=RequestMethod.POST)// 주로 post에서 service이용하여 로직처리함
	public String loginSubmit(Login login, HttpSession session,//submit하면 userId,password
					Model model)throws Exception { // Model이 필요해서 매개변수로 받아버림
		
		try {
			LoginMember me = service.login(login.getUserId(), login.getPassword());//member로 받아서 (admin인지 등등 구별하려고)
			//성공하면 세션에 정보를 추가하고, 리다이렉트
			session.setAttribute("USER", me);
			
			String url = login.getUrl();
			if(url!=null && !url.isEmpty()) return "redirect:" + url;
			
			return "redirect:/";
		} catch (LoginFailException e) {
			//실패하면 포워드 // 실패해서 되돌아왔을 때 다시 채워지는 문자열은 login.jsp의 ${}부분
			model.addAttribute("error", e.getMessage());
			return "account/login";
		}
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	

}
