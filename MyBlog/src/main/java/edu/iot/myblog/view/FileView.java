package edu.iot.myblog.view;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;



/**사용자 정의 뷰*/
// 파일의 내용을 읽어서 헤더를 골라서 파일의 내용을 직접내보내는 기능
// 아바타는 이것 사용 x 이미 이미지에 대한 data를 갖고 있음
@Component("fileView")
public class FileView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(
			Map<String, Object> model,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String path = (String) model.get("path");
		String type = (String) model.get("type");
		
		File file = new File(path);
		
		// 응답 헤더 설정
		response.setContentType(type);
		response.setContentLength((int) file.length());
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		// FileUtil에 copy메서드 만들기
		// 파일 경로를 복사해서 응답보내라는것.
		//FileUtil.copy(path, response.getOutputStream());
		/**base 폼에 <!-- Apache Commons IO -->의 부분에 있음*/
		FileUtils.copyFile(file, response.getOutputStream());
	}
	
}
