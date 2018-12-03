<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="context" value="${pageContext.request.contextPath}" scope="request"/>
<link rel="stylesheet" href="${context}/resources/css/main.css"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View User Info</title>
</head>
<script type="text/javascript">
$(function() {
	$('.delete-btn').click(function(e) {
		e.preventDefault();//a태그의 default event handler 부터 막기
		var result = confirm('${member.userId} 회원을 삭제할까요?');
		if (result) {
			location = $(this).attr('href');
		}
	})
	
	
	
});

</script>
<body>
	<div class="container">
	
		<h1 class="my-5">
			<i class="fas fa-list-ol"></i> User Info.
		</h1>
		<div class="row">
			<div class="col-md-2"> USER ID</div>
			<div class="col-md-2"> ${member.userId }</div>
		</div>
		<div class="row">
			<div class="col-md-2"> Name</div>
			<div class="col-md-2"> ${member.name }</div>
		</div>
		<div class="row">
			<div class="col-md-2"> level</div>
			<div class="col-md-2"> ${member.userLevel }</div>
		</div>
		<div class="row">
			<div class="col-md-2"> Nickname</div>
			<div class="col-md-2"> ${member.nickName }</div>
		</div>
		<div class="row">
			<div class="col-md-2"> Phone Number</div>
			<div class="col-md-2"> ${member.phoneNumber }</div>
		</div>
		<div class="row">
			<div class="col-md-2"> Email</div>
			<div class="col-md-2"> ${member.email }</div>
		</div>
		<div class="row">
			<div class="col-md-2"> Address</div>
			<div class="col-md-2"> ${member.address }</div>
		</div>
		<div class="row">
			
				<div class="col-md-2"> reg Date</div>

				<div class="col-md-10"><fmt:formatDate value="${member.regDate}" pattern="yyyy-MM-dd"/></div>
			
		</div>
		<div class="row">
			<div class="col-md-2"> update Date</div>
			
			<div class="col-md-10"><fmt:formatDate value="${member.updateDate}" pattern="yyyy-MM-dd"/></div>
		</div>
		
		<div class="row mt-3">
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<a href="../edit/${member.userId}?page=${param.page}" class="btn btn-unique btn-sm">EDIT</a>
				<a href="../delete/${member.userId}?page=${param.page}" class="delete-btn btn btn-unique btn-sm">DEL</a>
				<a href="../list?page=${param.page}" class="btn btn-unique btn-sm">BACK</a>
			</div>
		</div>
	
	</div>
</body>
</html>


