<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>



<script
	src="${context}/resources/bower_components/tinymce/tinymce.min.js">
</script>
<script>
	$(function() {
		tinymce.init({
			selector : 'textarea',
			height : "300"
		});

	})
</script>
<!-- <h2 class="mt-5 mb-4">게시글 수정</h2> -->
<br>
<iot:page-header icon="edit" title="EDIT POSTING"/>

<form:form commandName="Hboard">
	<form:hidden path="hboardId" />
	<form:hidden path="writer" />
	<div class="md-form">
		<label>Title</label>
		<form:input path="title" class="form-controll" required="required" />
		<form:errors path="title" />
	</div>
	<div class="md-form">
		<label>SubTitle</label>
		<form:input path="subtitle" class="form-controll" required="required" />
		<form:errors path="subtitle" />
	</div>
	
	
	<div class="mb-3">
		<label> 작성자 : ${USER.userId}</label>
	</div>



	
	<form:textarea path="content" />

	<div class="text-center mt-3">
		<button type="submit" class="btn btn-unique btn-md">
			<i class="fa fa-check mr-2"></i> OK
		</button>
		<a href="../view/${Hboard.hboardId}" class="btn btn-unique btn-md">
			<i class="fa fa-undo mr-2"></i> BACK
		</a>
	</div>
</form:form>
<br>