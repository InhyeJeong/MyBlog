package edu.iot.myblog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.iot.common.model.MailInfo;
import edu.iot.common.service.JavaMailService;
import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
@RequestMapping("/contact")
public class ContactController {
	
	//	이메일 연동에 필요한 서비스 연결
	@Autowired
	private JavaMailService service;
	
	/**mailForm : 메일 전송 form 출력 */
	@RequestMapping(value = "mailForm", method=RequestMethod.GET)
	public void mailForm(Model model) throws Exception {
		
		
	}
	
	/** mailSend */
	@RequestMapping(value = "mailSend", method=RequestMethod.POST)
	public String mailSend(Model model, MailInfo mailInfo) throws Exception {
		//	mailInfo (브라우저에서 입력받은 form data)
		String title = mailInfo.getTitle();
		String content = "보낸사람 : " +mailInfo.getName() +"\n" +
						"보낸 사람의 이메일 : " + mailInfo.getEmail() + "\n" +
						"보낸 사람의 핸드폰 번호 : " + mailInfo.getPhoneNumber() + "\n" +
						"내용 : " + mailInfo.getMessage();
		//	이메일 전송
		service.send(title, content);
		//	메일 전송 성공시 ct에게 보여줄 jsp로 이동
		return "redirect:/contact/mailSendOk";
	}
	
	/** mailSendOk GET*/
	@RequestMapping(value = "mailSendOk", method=RequestMethod.GET)
	public void mailSendOk() throws Exception {
		
		
	}
	

}
