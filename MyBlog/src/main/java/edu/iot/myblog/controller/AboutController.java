package edu.iot.myblog.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping("/about")
public class AboutController {
	
	/** 목록보기 /list */
	@RequestMapping(value = "view", method=RequestMethod.GET)
	public void list(Model model) throws Exception {

		
	}
}
