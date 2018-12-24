package edu.iot.myblog.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import edu.iot.common.model.Hboard;
import edu.iot.common.model.MyGalleryImage;

import edu.iot.common.service.MyGalleryImageService;
import edu.iot.common.util.ImageUtil;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/gallery")
@Slf4j
public class MyGalleryController {

	@Autowired
	MyGalleryImageService service;

	@Autowired
	ServletContext context;

	/** 목록보기 /list */
	@RequestMapping(value = "list", method=RequestMethod.GET)
	public void list(Model model) throws Exception {

		// gallery 찾기
		List<MyGalleryImage> list = service.getList();
		
		// 모델에 mgallery라는 키값으로 list 저장
		model.addAttribute("mgallery", list);

	}
	
	
	
	
	
	/** 새로운 data 추가할 때의 기본 골격 : 갤러리 추가하는 메서드 create */
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public void createForm(MyGalleryImage mgallery, Model model) throws Exception {
		model.addAttribute("mgallery", mgallery);
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String createSubmit(@Valid MyGalleryImage mgallery, BindingResult result, Model model) throws Exception {
		if (result.hasErrors()) {// 유효성 검사 실패
			
			return "gallery/create";
		}
	
		service.create(mgallery);
		// galleryId가 지정되어 있지 않다 seq를 통해 지정된다.
		model.addAttribute("mgallery", mgallery);
		return "redirect:/gallery/update/" + mgallery.getImageId();

	}

	
	
	
	/** update */
	@RequestMapping(value = "/update/{imageId}", method = RequestMethod.GET)
	public String updateForm(@PathVariable long imageId, Model model) throws Exception {
		// gallery_id로 꺼내서 model에 담고 update.jsp에서 수정화면 만들기

		// gallery 찾기
		//List<MyGalleryImage> mgallery = service.getList();
		MyGalleryImage mgallery = service.findById(imageId);
		model.addAttribute("mgallery", mgallery);

		return "gallery/update";

	}

	// {galleryId}는 url에서 받아온다. update.jsp에서 action 파트가 빠져있다.
	// 이 때문에 get과 post는 같은 url을 사용한다.
	// form의 action태그 :폼 데이터가 전송되는 백엔드 url
	/**
	 * form라이브러리의 action 파트에 url을 지정하지 않으면 form태그라이브러리에서 자동으로 현재 url을 action파트에
	 * 지정해준다. 이미 gallery에 galleryId가 폼태그에 의해 저장되어 있으므로 따로 @PathVarialble 을 사용할 필요가
	 * 없다. 위의 updatForm에는 어노테이션을 사용하여 변수로 받아줘야한다.
	 */
	@RequestMapping(value = "/update/{imageId}", method = RequestMethod.POST)
	public String updateSubmit(@Valid MyGalleryImage mgallery, BindingResult result) throws Exception {
		if (result.hasErrors()) {// 유효성검사실패
			return "gallery/update";
		}

		// 유효성 검사 통과
		service.update(mgallery);
		return "redirect:/gallery/update/" + mgallery.getImageId();
	}
	
	
	
	
	
	/** add_image */
	@RequestMapping(value = "/update/add_image", method = RequestMethod.POST)
	public String addImageSubmit(MyGalleryImage image,
			// 업로드된 정보가 imageFile객체에 담기게 되고 이것을 가지고 업로드된 파일을 조작할 수 있음
			@RequestParam("file") MultipartFile imageFile) throws Exception {
		log.info(image.toString());
		// 파일업로드
		uploadImage(image, imageFile);

		/** gallery-mapper> GalleryDao >GalleryService & Impl 등록하고 addImage사용 */
		service.addImage(image);
		log.warn("addImageSubmit 실행됨!!!!!!!!!!!!!");
		// db저장
		//return "redirect:/gallery/list";
		return "redirect:/gallery/update/" + image.getImageId();	// 이미지 업로드 목록을 보여주도록

	}

	

	/** 다중파일 업로드 : add_images // MultipartHttpServletRequest 사용 */
	@RequestMapping(value = "/update/add_images", method = RequestMethod.POST)
	public String addImagesSubmit(MyGalleryImage image, MultipartHttpServletRequest request,
			Model model) throws Exception {
		// 여기서 request는 MultipartHttpServletRequest의 req임
		List<MultipartFile> fileList = request.getFiles("files");
		
		for (MultipartFile imageFile : fileList) {
			uploadImage(image, imageFile);
			service.addImage(image);
		}
		

		log.warn("addImagesssssssssSubmit 실행됨!!!!!!!!!!!!!");
		return "redirect:/gallery/list";//	업로드를 완료하면 list로 바로 가도록
		//return "redirect:/gallery/update/" + image.getImageId();	// 이미지 업로드 목록을 보여주도록
	}

	
	/** 단일 파일 업로드 처리시 사용 // MultipartFile 사용 */

	private void uploadImage(MyGalleryImage image, MultipartFile imageFile) throws Exception {
		// 원본 이미지 파일명
		String fname = imageFile.getOriginalFilename();
		// 서버에서의 이미지 파일명 (타임스탬프 추가)
		long timestamp = System.currentTimeMillis();
		String serverFileName = timestamp + "_" + fname;

		// 업로드 파일 재배치
		File dest = new File("/upload/" + serverFileName);
		imageFile.transferTo(dest);// 내가원하는 위치로 파일 이동하는 MultipartFile의 메서드

		// 썸네일 이미지 생성 : SpringCommon프로젝트 >util패키지
		ImageUtil.saveThumb(dest);

		// GalleryImage 정보 설정
		image.setFileName(fname);
		image.setServerFileName(serverFileName);
	}

	
	
	// a태그, 일반적인 것은 (GET) / 자바스크립트,폼(POST)
	/**image 보여줌 : 원본 추출 + 썸네일 추출 mode로 받아서 둘다 처리하기*/
	@RequestMapping(value="/{mode}/{imageId}", method=RequestMethod.GET)
	public String image (
						@PathVariable String mode,
						@PathVariable long imageId,
						Model model) throws Exception {
		// galleryImage 필요(mapper에 만들기 : getImage )
		//System.out.println("이미지 보여주기 실행됨");
		MyGalleryImage image = service.findById(imageId);
		//System.out.println(image);
		// 서버의 파일명 
		String path = "/upload/";
		
		if(mode.equals("thumb")) {
			path+="thumb/";
			
		}
		path+=image.getServerFileName();
		//System.out.println(path);
		/**위에서 @Autowired 로 context를 얻고 어플리케이션 객체의getMimeType메서드를 이용*/
		String type = context.getMimeType(path);	// 파일의 Mimetype(컨텐트에 대한 정보ex. byte, jpg, png 등등) 문자열
		
		// 모델에 받기
		model.addAttribute("path", path);
		model.addAttribute("type", type);
		
		return "fileView";// 컨트롤러의 역할: 필요한 정보를 찾아내서 뷰로 넘김
		// 여기서 return 값은 jsp의 이름이 아니라 사용자 정의 뷰의 이름임
		
		}
	
	
	
	
	@ResponseBody
	@RequestMapping(value="delete",
					method=RequestMethod.GET,
					produces = "text/plain; charset=utf8")
	public String delete(MyGalleryImage mgallery) {
		log.warn("delete 컨트롤러 실행됨");
		try {
			service.delete(mgallery);
//			list.jsp의 jQuery Ajax 호출부분의 result 값과 return('delete')과 일치 시켜야함
			return "delete";	
		} catch (Exception e) {
			return e.getMessage();
		}
	}
}
