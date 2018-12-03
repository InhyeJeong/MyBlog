<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="context" value="${pageContext.request.contextPath}" scope="request"/>
<link rel="stylesheet" href="${context}/resources/css/main.css"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CREATE</title>

<script src="${context}/resources/bower_components/tinymce/tinymce.min.js"></script>
 <!-- jquery load -->

 <script type="text/javascript" src="${context}/resources/bower_components/jquery/dist/jquery.js"></script>



<script>
	$(function(){
		tinymce.init({
			selector:'textarea',
			height : "300"
		});
	})
</script>
</head>
<body>
	<br>
	<h2 class="mt-5 mb-4"> POSTING </h2>
	
	<form:form commandName="hboard"  >
		<input type="hidden" name="writer" value="${hboard.hboardId}"/>
		<div class="md-form">
			<label> Title</label>
			<form:input path="title" class="form-control"/>
			<form:errors path="title"/>
		</div>
		
		<div class="md-form">
			<label> SubTitle</label>
			<form:input path="subtitle" class="form-control"/>
			<form:errors path="subtitle"/>
		</div>
		
		<br>
		<div class="mb-3">
			<label>WRITER : ${hboard.writer}</label>
		</div>
		
		
		
		<form:textarea path="content"/>
		
		<div class="text-center mt-3">
			<button type="submit" class="btn btn-unique btn-md">
				<i class="fas fa-check mr-2"></i> CHECH</button>
			<a href="#" onclick="history.back()" class="btn btn-unique btn-md">
				<i class="fas fa-undo mr-2"></i> BACK</a>

		</div>
		
	</form:form>

</body>
</html>


