<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<script>
	$(function() {
		/**edit의 첨부파일 삭제랑 거의 비슷*/

		//	삭제눌렀을때 alert
		$('#delete-btn').click(function(e) {
			e.preventDefault();
			var hboardId = $(this).data('target');
			var result = confirm("게시글을 삭제할까요?");

			if (!result)
				return;

			var url = '../delete';
			var params = {
				hboardId : hboardId
			};

			/**Ajax 호출*/
			$.get(url, params, function(result) {
				// 결과 응답 데이터는 result로 전달됨
				// 이곳에서 this는 Ajax핸들러이므로(더 이상 a태그가 아님) this 사용불가

				if (result == 'delete') {
					//어디로 어떻게 이동?:javascript로 페이지 이동 location
					location = '../';
				} else {
					alert('삭제 실패 : ' + result);
				}
			});

		});

	});
</script>

<br><br>
<header >
<!-- 사용자 태그라이브러리 사용  -->
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>

<!-- Page Header -->
<%-- <header class="masthead" style="background-image: url('${context}/resources/img/gray.png')"> --%>
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="post-heading">
					<iot:page-animate-board title="${Hboard.title }" /> <!-- 사용자 태그라이브러리 사용  -->
					<h2 class="subheading">${Hboard.subtitle }</h2>
					<!--${Hboard.writer }  -->
					<span class="meta">Posted by TONZ, On <fmt:formatDate value="${Hboard.regDate}" pattern="yyyy-MM-dd" />
					<br>
					<span>Views ${Hboard.readCnt}</span>
					</span>
				</div>
			</div>
		</div>
	</div>
</header>
<br><br>
<hr>

<!-- 본문내용 -->
<div class="container">
	<br>
	<div class="col-lg-8 col-md-10 mx-auto">${Hboard.content}</div>
	<br>
</div>




<!-- 로그인 사용자만 수정, 삭제 가능 -->
<c:if test="${not empty USER}">
	<div class="text-center">

		<a href="../edit/${Hboard.hboardId}" class="mr-4" style="color: gray;">
			<i style="color: gray;" class="fas fa-edit mr-2"></i> EDIT
		</a>
		<a href="#" id="delete-btn" data-target="${Hboard.hboardId}" class="mr-4" style="color: gray;">
			<i class="fas fa-trash mr-2" style="color: gray;"></i> DELETE
		</a>
		<a href="#" onclick="history.back()" style="color: gray;">
			<i class="fas fa-undo mr-2" style="color: gray;"></i> BACK
		</a>
	</div>
</c:if>







