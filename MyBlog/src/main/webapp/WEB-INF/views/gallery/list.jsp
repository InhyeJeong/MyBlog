<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="context" value="${pageContext.request.contextPath}"
	scope="request" />


<!DOCTYPE html>
<html>
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

		<%-- <c:if test="${not empty USER}"> --%>
		<div class="float-right">
			<a href="create"><i class="fas fa-plus"></i> Add Gallery</a>
		</div>
		<%-- </c:if> --%>
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


