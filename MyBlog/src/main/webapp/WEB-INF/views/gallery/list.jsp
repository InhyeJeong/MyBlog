<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="context" value="${pageContext.request.contextPath}"
	scope="request" />
<link rel="stylesheet" href="${context}/resources/css/main.css" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gallery List</title>
</head>
<body>
	<br>
	<h1 class="my-5">My GALLERY</h1>
	<div>
		<%-- <div class="float-left">
			<form action="list">
				ORDER BY <select name="orderBy">
					<option value="mgallery_id"
						<c:if test="${orderBy=='mgallery_id'}">selected</c:if>>
						Date</option>
					<option value="read_cnt"
						<c:if test="${orderBy=='read_cnt'}">selected</c:if>>
						Views</option>
				</select>
				<button type="submit" class="btn btn-unique btn-sm">
					<i class="fas fa-share-square"></i>
				</button>
			</form>
		</div> --%>

		<%-- <c:if test="${not empty USER}"> --%>
			<div class="float-right">
				<a href="create"><i class="fas fa-plus"></i> Add Gallery</a>
			</div>
		<%-- </c:if> --%>
	</div>


	<!--lightBox해보자 !  -->

	<!--First row-->
	<div class="row">

		<!--First column-->
		<div class="col-md-12">

			<div id="mdb-lightbox-ui"></div>

			<!--Full width lightbox-->
			<div class="mdb-lightbox">
				
			
			
				<c:forEach var="image" items="${mgallery}" varStatus="status">
					<!-- 썸네일 이미지 -->
						<figure class="col-md-3  <c:if test="${status.first}">active</c:if> ">
							
								<a href="../image/${image.imageId}">
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






	 <%-- <table class="table table-striped ">
		<thead>
			<tr>
				<th>No</th>
				<th>Title</th>
				<th>Owner</th>
				<th>Gallery Num</th>
				<th><a href="?orderBy=reg_date"> Date </a></th>
				<th><a href="?orderBy=read_cnt"> Total Views </a></th>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}" varStatus="status">
				<fmt:formatDate var="regDate" value="${item.regDate }"
					pattern="yyyy-MM-dd" />
				<tr>
					<td>${item.galleryId}</td>
					<!--클릭시 view로 들어감  -->
					<td><a href="view/${item.galleryId}?page=${pagination.page}">
							${item.title}
						</a>
						<c:if test="${today==regDate}">
							<span class="badge badge-pill badge-danger"> <i
								class="fas fa-tag"></i> New
							</span>
						</c:if>
						
						<c:if test="${not empty item.list[0]}">
							<img src="thumb/${item.list[0].imageId}" width="30">
						</c:if>
						
					</td>
					<td>${item.owner}</td>
					<td>${item.list[0].imageId}/ ${item.list.size()}</td>
					<td>${regDate}</td>
					<td>${item.readCnt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>  --%>




</body>
</html>


