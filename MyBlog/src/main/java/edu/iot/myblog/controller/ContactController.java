package edu.iot.myblog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.iot.common.model.MailInfo;
import edu.iot.common.service.JavaMailService;


@Controller
@RequestMapping("/contact")
public class ContactController {
	
	@Autowired
	private JavaMailService service;
	
	/** 메일 전송 form */
	@RequestMapping(value = "mailForm", method=RequestMethod.GET)
	public void mailForm(Model model) throws Exception {
		
		
	}
	
	/** 전송 성공시 jsp로 */
	@RequestMapping(value = "mailSend", method=RequestMethod.POST)
	public String mailSend(Model model, MailInfo mailInfo) throws Exception {
		System.out.println(mailInfo);
		String title = mailInfo.getTitle();
		String content = "보낸사람 : " +mailInfo.getName() +"\n" +
						"보낸 사람의 이메일 : " + mailInfo.getEmail() + "\n" +
						"보낸 사람의 핸드폰 번호 : " + mailInfo.getPhoneNumber() + "\n" +
						"내용 : " + mailInfo.getMessage();
		
		service.send(title, content);
		return "redirect:/contact/mailSendOk";
	}
	@RequestMapping(value = "mailSendOk", method=RequestMethod.GET)
	public void mailSendOk() throws Exception {
		
		
	}
	

}
