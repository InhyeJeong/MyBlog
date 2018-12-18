package edu.iot.myblog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/contact")
public class ContactController {
//	
//	@Autowired
//	private EmailSender emailSender;
	
	/** 메일 전송 form */
	@RequestMapping(value = "mailForm", method=RequestMethod.GET)
	public void mailForm(Model model) throws Exception {

		
	}
	
	/** 전송 성공시 jsp로 */
	@RequestMapping(value = "mailSend", method=RequestMethod.POST)
	public void mailSend(Model model) throws Exception {

		
	}

	

}
