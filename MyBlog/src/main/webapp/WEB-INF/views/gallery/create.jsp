<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="context" value="${pageContext.request.contextPath}"
	scope="request" />
<link rel="stylesheet" href="${context}/resources/css/main.css" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create New Gallery</title>
</head>
<body>
	<br>
	<div class="row">
		<div class="col-md-8 offset-md-2">
	<br><br>
	
			<h1 class="my-5" style="font-style:italic; color: gray;">
				<i class="fas fa-plus"></i> UPLOAD IMAGE
			</h1>

			
<form:form commandName="mgallery">
			<!-- 방법2: login한 사용자만 submit할 수 있도록 hidden으로 처리 -->
		<%-- <input type="hidden" name="owner" value="${gallery.owner}"> --%>
		
				<div class="md-form">
					<label for="title"> Title</label>
					<form:input path="title" class="form-control"/>
					<form:errors path="title" element="div" cssClass="errer"/>
				</div>
				
				<div class="md-form">
					<label for="description"> Description</label>
					<form:textarea path="description" class="form-control" rows="4" />
				</div>
				
				<p>
					<button type="submit" class="btn btn-unique">
						<i class="fas fa-check"></i> Check
					</button>
					<button type="submit" class="btn btn-unique">
						<i class="fas fa-undo"></i> Cancel
					</button>
				</p>


</form:form>


		</div>
	</div>
</body>
</html>


