package edu.iot.myblog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.iot.common.dao.Email;
import edu.iot.common.dao.EmailSender;

@Controller
@RequestMapping("/contact")
public class ContactController {
//	
//	@Autowired
//	private EmailSender emailSender;
	
	/** 목록보기 /list */
	@RequestMapping(value = "mailForm", method=RequestMethod.GET)
	public void mailForm(Model model) throws Exception {

		
	}
	
	/** 목록보기 /list */
	@RequestMapping(value = "mailSend", method=RequestMethod.POST)
	public void mailSend(Model model) throws Exception {

		
	}

	

}
