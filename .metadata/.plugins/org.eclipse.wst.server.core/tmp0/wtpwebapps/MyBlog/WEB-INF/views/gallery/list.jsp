<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="context" value="${pageContext.request.contextPath}"
	scope="request" />


<!DOCTYPE html>
<html>


<script>
	$(function() {
		//	삭제눌렀을때 alert
		$('.delete-btn').click(function(e) {
			e.preventDefault();
			//	this는 클릭된 a태그(삭제버튼)
			var imageId = $(this).data('target');
			var result = confirm("사진을 삭제할까요? ");

			if (!result) return;
		
			var url = '../gallery/delete';	//	url이 다른 Ajax delete url과 겹치지 않도록 주의
			var params = {
				imageId : imageId
			};

			/**Ajax 호출*/
			$.get(url, params, function(result) {
				// 결과 응답 데이터는 result로 전달됨
				// 이곳에서 this는 Ajax핸들러이므로(더 이상 a태그가 아님) this 사용불가

				if (result == 'delete') {	// MyGalleryController의 delete 메서드의 return값과 일치
					location = '../gallery/list';
				} else {
					alert('삭제 실패 : ' + result);
				}
			});

		});

	});
</script>

<head>
<link
	href="${context}/resources/bower_components/lightbox/src/css/lightbox.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${context}/resources/bower_components/lightbox/src/js/lightbox.js"></script>
<meta charset="UTF-8">
<title>Gallery List</title>
</head>

<body>
	<br>
	<br>

	<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>
	<iot:page-animate-header title="My GALLERY" />

	<div>
		<!--로그인 사용자만 사진 추가가능 -->
		<c:if test="${not empty USER}">
			<div class="float-right">
				<a href="create"><i class="fas fa-plus"></i> Add Gallery</a>
			</div>
		</c:if>
	</div>
	<br><br>

	<!--lightBox해보자 !  -->
	<div class="container-fluid">
		<!--First row-->
		<div class="row">

			<!--First column-->


			<div id="mdb-lightbox-ui"></div>

			<!--Full width lightbox-->
			<div class="mdb-lightbox" data-pswp-uid="6">

				<!-- 썸네일 이미지 -->
				<!--div태그의 row와 col은 set로 묶여야 제대로 출력됨-->
				<div class="row">
					<c:forEach var="image" items="${mgallery}" varStatus="status">
						<div class="col-md-3">
							<figure>
								<a href="../gallery/image/${image.imageId}"
									data-lightbox='roadtrip'> <img class="img-fluid"
									src="../gallery/image/${image.imageId}"
									alt="${image.fileName} / ${image.title }">
								</a>

							</figure>
							<!-- 로그인 사용자만 삭제 가능 -->
							<c:if test="${not empty USER}">
								<div class="text-center">
									
									<a href="#" class="delete-btn" data-target="${image.imageId}" class="mr-4" style="color: gray;">
										<i class="fas fa-trash mr-2" style="color: gray;"></i> DELETE
									</a>
									
								</div>
							 </c:if>
						</div>
					</c:forEach>
				</div>
			</div>
			<!--/Full width lightbox-->

			<!--/First column-->
		</div>
		<!--/First row-->
	</div>
</body>
</html>


