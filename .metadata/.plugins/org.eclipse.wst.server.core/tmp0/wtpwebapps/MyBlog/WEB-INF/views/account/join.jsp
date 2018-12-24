<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="context" value="${pageContext.request.contextPath}" scope="request"/>
<link rel="stylesheet" href="${context}/resources/css/main.css"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIGN UP PAGE</title>
</head>

<script type="text/javascript">

//capricorn프로젝트의 join과 구성 거의 똑같음
//중복검사를 위해 id 배정해놓았음 

$(function() {
//Ajax : Asynchronous(비동기적:바로 리턴한다.)JavaScript Xml(브라우저가 화면교체하지 않고 자바스크립트하고 서버하고 바로 통신할 수 있는 기능ex.지도기능)
//xml이 크기가 커서 지금은 json으로 통신함
	$('#id-check').click(function(){
		var userId = $('#userId').val(); //input의 value를 얻는 메서드
		if(!userId) {
			return alert('사용자 Id를 입력하세요');
		}
		var url = '${context}/account/idcheck'; // ?userId=' + userId;
		var params = {//위의 오른쪽 내용을 객체로 받음 key:value
				userId : userId
		};
		
		//get은 Ajax
		//paramas를 get메서드의 2번째 인자로 주면 get이 알아서 바꿔줌 value 파트 인코딩까지 해줌
		$.get(url, params, function(data){ //요청할 url을 get으로 요청함 IdCheckServlet.java의 내용을 data(ok or fail)로 받음
			if(data =="ok") {// id중복 아님
				//massage 구성
				$('.check-result').text('사용 가능한 ID 입니다.')
									.removeClass('error');
				//submit버튼을 활성화 disabled 버튼 제거
				$('[type=submit]').prop('disabled', false);
			} else {//id 중복
			
				//error message 구성
				$('.check-result').text('이미 사용 중인 ID입니다.')
									.addClass('error');
				//submit버튼 비활성화 disabled 버튼 추가
				$('[type=submit]').prop('disabled', true);
				//프로퍼티명 바꿀 때는 prop, 속성값 수정은 attr(ex. selected required, 이미지태그의 src="")
			}
		});	
	});
	
	$('#userId').keyup(function(){ //jQuery 키보드 이벤트 이용
		$('.check-result').text('ID 중복 검사를 하세요.')
						.removeClass('error');
		$('[type=submit]').prop('disabled', true);

	});
	
	
	//비밀번호 일치 확인
	// a태그와 submit에서 자주쓰임
	$('form').submit(function(e){
		e.preventDefault(); // 제출 디폴트를 막는다.
		
		//비밀번호 확인 체크
		var password = $('[name=password]').val();
		var password2 = $('[name=password2]').val();
		if(password !=password2) {
			alert('비밀번호가 일치하지 않습니다.');
			$('[name=password]').focus();
			return;
		}
		this.submit();//this는 form
	})
		
});
</script>

<body>
	<div class="row">
	<div class="col-md-8 offset-md-2">
	 <!-- 컬럼 8개 사용, 좌우 md 2이 있는 효과(중앙배치)-->
	 
	 	<h1 class="my-5">
	 		<i class="fas fa-user-plus"></i> SIGN UP
	 	</h1>
	 	
		 <form:form commandName="member">
		 
			 <div class="md-form">
			 	<label for="userId"> ID </label>
			 	<form:input path="userId" class="form-control"/>
				<form:errors path="userId" element="div" cssClass="error"/>
			</div>
			
			<p>
				<button type="button" id="id-check">ID CHECK</button>
				<span class="check-result"> Check Your ID </span>
			</p>
			
			
			<div class="md-form">
			 	<label for="password"> PW </label>
			 	<form:input path="password" class="form-control"/>
				<form:errors path="password" element="div" cssClass="error"/>
			</div>
			
			
			<div class="md-form">
			 	<label for="password2"> Check Your Password </label>
			 	<input type="password" id="password2" name="password2" class="form-control">
				<form:errors path="password" element="div" cssClass="error"/>
			</div>
			
			<div class="md-form">
			 	<label for="name"> NAME </label>
			 	<form:input path="name" class="form-control"/>
				<form:errors path="name" element="div" cssClass="error"/>
			</div>
			
			<div class="md-form">
			 	<label for="phoneNumber"> PHONE NUMBER </label>
			 	<form:input path="phoneNumber" class="form-control"/>
				<form:errors path="phoneNumber" element="div" cssClass="error"/>
			</div>
			
			<div class="md-form">
			 	<label for="nickName"> NiCK NAME </label>
			 	<form:input path="nickName" class="form-control"/>
			</div>
				
			<div class="md-form">
			 	<label for="email"> EMAIL </label>
			 	<form:input path="email" class="form-control"/>
			</div>
			
			<div class="md-form">
			 	<label for="address"> ADDRESS </label>
			 	<form:input path="address" class="form-control"/>
			</div>
		
			
			<p>
				<button type="submit" class="btn btn-unique" disabled>
					<i class="fas fa-check"></i> SIGN UP
				</button>
				<button type="reset" class="btn btn-unique">
					<i class="fas fa-undo"></i> CANCLE
				</button>
			</p>
		</form:form>
	</div>
</div>
</body>
</html>


