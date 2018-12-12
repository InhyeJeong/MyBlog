# [**MyBlog**](http://13.209.26.216:8080/travelhelper/)


Spring MVC 패턴으로 만든 개인 블로그 반응형 웹사이트 입니다.

* 2018년 11월 ~ (진행중)
*  이 프로젝트의 **Tech Stack**
<pre><code>
jQuery / javascript / java / lombok / css3 /
html5 / oracle / tomcat8.5 / Spring / MDBootstrap /
Mybatis / JDBC / json / tinymce / Ajax
</pre></code>

* [**MyBlog Link**](http://13.209.26.216:8080/travelhelper/)





<br>


## 메뉴별 기능 소개

### 1. Home
- 게시판 업로드 및 삭제(ADMIN 계정만 사용가능)
- 각 게시물 별 조회수 기록
- 로그인 인터셉터

### 1-1. LogIn (ADMIN 계정만 사용가능)

- 로그인 기능( 개인 운영용이기 때문에 db로 아이디 등록, 비밀번호 암호화) 

### 2. About

- 자기소개 페이지

### 3. Gallery

- 사진 업로드/삭제(Ajax) 가능(ADMIN 계정만 사용가능)
- LightBox를 활용하여 사진 뷰

### 4. Contact

* 방문자가 이름, 연락처, 이메일, 내용을 작성하면 **연동된 ADMIN 이메일**로 전송되는 기능




<br>

## 사용된 기술

#### 사용자 정의 뷰 사용

* Gallery 메뉴에서 Lightbox **이미지 출력**에 [사용자 정의 뷰(FileView)](./MyBlog/src/main/java/edu/iot/myblog/view)를 사용했습니다.

```dart
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
		
		// Header Setting
		response.setContentType(type);
		response.setContentLength((int) file.length());
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		// Apache Commons IO
		FileUtils.copyFile(file, response.getOutputStream());
	}
	
}```
  
#### Ajax
* 게시물 삭제 및 댓글 작성 Ajax 처리
자세한 내용은 [view.jsp](./MyBlog/src/main/webapp/WEB-INF/views) 폴더에 있습니다.
```dart
	$(function() {
		//	삭제눌렀을때 alert
		$('.delete-btn').click(function(e) {
			e.preventDefault();
			//	this는 클릭된 a태그(삭제버튼)
			var imageId = $(this).data('target');
			var result = confirm("사진을 삭제할까요? ");

			if (!result) return;

			var url = '../gallery/delete';
			var params = {
				imageId : imageId
			};

			/**Ajax 호출*/
			$.get(url, params, function(result) {
				if (result == 'delete') {
					//어디로 어떻게 이동?:javascript로 페이지 이동 location
					location = '../gallery/list';
				} else {
					alert('삭제 실패 : ' + result);
				}
			});
		});
	});```

