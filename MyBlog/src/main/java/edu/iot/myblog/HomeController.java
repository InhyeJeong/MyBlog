package edu.iot.myblog;

import java.text.DateFormat;
import java.util.Date;

import java.util.Locale;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;
import edu.iot.common.exception.IDMissmatchException;

import edu.iot.common.model.Hboard;
import edu.iot.common.service.HBoardService;
import lombok.extern.slf4j.Slf4j;


/**
 * Handles requests for the application home page.
 */
//	메인 페이지 게시판 컨트롤러
@Slf4j
@RequestMapping("/")
@Controller
public class HomeController {
	// 서비스 연결
	@Autowired
	HBoardService service;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model)throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("list", service.getList());
		
		return "home";
	}
	
	
	//	게시글 생성
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public void createForm(Hboard hboard) throws Exception {
		
	}
	//	게시글 생성 submit >post
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String createSubmit(
					@Valid Hboard hboard, BindingResult result)throws Exception {
		//	유효성 검사
		if(result.hasErrors()) return "create";
		
		//	유효성 검사 통과시
		//	게시글 create
		service.create(hboard);
		
		//	home으로 리다이렉트
		return "redirect:/";
		
	}
	
	//	게시물 상세보기
	@RequestMapping(value = "/view/{hboardId}", method = RequestMethod.GET)
	public String view(@PathVariable long hboardId, Model model) throws Exception {
		//	ID로 게시물 찾기
		Hboard hboard = service.findById(hboardId);
		//	jsp에서 보여주기위해 model에 저장
		model.addAttribute("Hboard", hboard);
		
		return "view";
	}
	
	//	게시물 수정 editForm
	//	pathvariable (URL 경로에 변수를 넣어주는 기능)
	@RequestMapping(value = "/edit/{hboardId}", method = RequestMethod.GET)
	public String editForm(@PathVariable long hboardId, Model model) throws Exception {
		//	ID로 게시글 찾기
		Hboard hboard = service.findById(hboardId);
		//	모델에 저장
		model.addAttribute("Hboard", hboard);

		return "editing";
	}
	
	//	게시물 수정 submit
	@RequestMapping(value = "/edit/{hboardId}", method = RequestMethod.POST)
	public String editSubmit(@Valid Hboard hboard, BindingResult result) throws Exception {
		//	유효성 검사
		if (result.hasErrors()) return "editing";
		//	유효성 검사 통과
		try {
			service.update(hboard);
		} catch (IDMissmatchException e) {	//	ID일치 하지 않을시 exception
			result.reject("updateFail", e.getMessage());	//	에러메시지 출력
			
			return "editing";
		}
		//	수정 완료시 수정된 게시물 출력 
		return "redirect:/view/" + hboard.getHboardId();
	}
	
	
	
	
	//	@ResponseBody사용하여 return값 ajax와 연결
	@ResponseBody
	@RequestMapping(value="delete",
					method=RequestMethod.GET,
					produces = "text/plain; charset=utf8")
	public String delete(Hboard hboard) {

		try {
			service.delete(hboard);
			return "delete";
		} catch (Exception e) {
			return e.getMessage();
		}
	}
	
	
}
