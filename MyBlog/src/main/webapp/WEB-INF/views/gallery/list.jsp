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
<link href="${context}/resources/bower_components/lightbox/src/css/lightbox.css" rel="stylesheet">
<script type="text/javascript"
	src="${context}/resources/bower_components/lightbox/src/js/lightbox.js"></script>
<meta charset="UTF-8">
<title>Gallery List</title>
</head>
<style>
.mdb-lightbox figure .img-fluid, .mdb-lightbox figure .mdb-lightbox  {
    display: inline;
}
.mdb-lightbox figure img {
    cursor: -webkit-zoom-in;
    cursor: zoom-in;
    -webkit-transition: opacity .4s;
    -o-transition: opacity .4s;
    transition: opacity .4s;
    -webkit-border-radius: 0;
    border-radius: 0;
}



img {
    vertical-align: middle;
    border-style: none;
}



.row {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
}


</style>
<body>
	<br><br>

<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>
<iot:page-animate-header title="My GALLERY" />
	
	<div>

		<%-- <c:if test="${not empty USER}"> --%>
			<div class="float-right">
				<a href="create"><i class="fas fa-plus"></i> Add Gallery</a>
			</div>
		<%-- </c:if> --%>
	</div>
<br>

	<!--lightBox해보자 !  -->

	<!--First row-->
	<div class="row">

		<!--First column-->
		<div class="col-md-12">

			<div id="mdb-lightbox-ui"></div>

			<!--Full width lightbox-->
			<div class="mdb-lightbox" data-pswp-uid="6">
				
			
				<!-- 썸네일 이미지 -->
				<c:forEach var="image" items="${mgallery}" varStatus="status">
						<figure class="col-md-3">
								<a href="../gallery/image/${image.imageId}" data-lightbox='roadtrip'>
									<img class="img-fluid" src="../gallery/image/${image.imageId}" alt="${image.fileName} / ${image.title }">
								</a>
							
						</figure>
				</c:forEach>



			</div>
			<!--/Full width lightbox-->

		</div>
		<!--/First column-->

	</div>
	<!--/First row-->
</body>
</html>


