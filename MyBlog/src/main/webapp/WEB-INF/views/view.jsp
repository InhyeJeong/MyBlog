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

<!-- Page Header -->
<header class="masthead"
	style="background-image: url('${context}/resources/img/post-bg.jpg')">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="post-heading">
					<h1>${Hboard.title }</h1>

					<h2 class="subheading">${Hboard.subtitle }</h2>
					<span class="meta">Posted by <a href="#">${Hboard.writer }</a>
					</span>
				</div>
			</div>
		</div>
	</div>
</header>
<br>
<div class="container">
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>
<iot:page-animate-header title="VIEW POSTING" />


<div class="row">
	<div class="col-md-2">작성자</div>
	<div class="col-md-10">${USER.userId}</div>
</div>
<div class="row">
	<div class="col-md-2">조회수</div>
	<div class="col-md-10">${Hboard.readCnt}</div>
</div>

<div class="row">
	<div class="col-md-2">작성일</div>
	<div class="col-md-10">
		<fmt:formatDate value="${Hboard.regDate}" pattern="yyyy-MM-dd" />
	</div>
</div>
<div class="row">
	<div class="col-md-2">수정일</div>
	<div class="col-md-10">${Hboard.strRegDate}</div>
</div>
<hr>

<div>${Hboard.content}</div>

<br>
</div>


<%-- <!-- Post Content -->
<article>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<p>.</p>


				<h2 class="section-heading">The Final Frontier</h2>
				<p></p>
				<blockquote class="blockquote"></blockquote>
				<p></p>

				<h2 class="section-heading">Reaching for the Stars</h2>
				<p></p>

				<a href="#"> <img class="img-fluid"
					src="${context}/resources/img/post-sample-image.jpg" alt="">
				</a> <span class="caption text-muted">사진설명</span>
				<p></p>

				<p>
					출처 Placeholder text by <a href="http://spaceipsum.com/">Space
						Ipsum</a>. Photographs by <a
						href="https://www.flickr.com/photos/nasacommons/">NASA on The
						Commons</a>.
				</p>
			</div>
		</div>
	</div>
</article>

<hr> --%>


<!-- 로그인 사용자 -->
<c:if test="${not empty USER}">
	<div class="text-center">

		<a href="../edit/${Hboard.hboardId}" class="mr-4" style="color: gray;">
			<i style="color: gray;" class="fas fa-edit mr-2"></i> EDIT
		</a> <a href="#" id="delete-btn" data-target="${Hboard.hboardId}"
			class="mr-4" style="color: gray;"> <i class="fas fa-trash mr-2"
			style="color: gray;"></i> DELETE
		</a> <a href="#" onclick="history.back()" style="color: gray;"> <i
			class="fas fa-undo mr-2" style="color: gray;"></i> BACK
		</a>
	</div>
</c:if>







