<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="context" value="${pageContext.request.contextPath}" scope="request"/>
<link rel="stylesheet" href="${context}/resources/css/main.css"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User Info</title>
</head>
<body>
<div class="container">
	<h1 class="my-5"> Edit User Info</h1>
	
	<form:form commandName="member">
		<form:hidden path="userId"/>
		<form:hidden path="name"/><!--유효성검사를 위해 hidden으로 넘김 -->
			<div>
				<label> USER ID</label>
				<p>${member.userId }</p>
			</div>
			<div>
				<label for="name">name</label>
				<p>${member.name }</p>
			</div>
			
			<label for="userLevel"> Level</label>
			<form:select path="userLevel" items="${userLevels}"></form:select>
			
			<div class="md-form">
				<label for="nickName"> Nickname</label>
				<form:input path="nickName" class="form-control"/>
			</div>
			<div class="md-form">
				<label for="PhoneNumber"> Phone Number</label>
				<form:input path="phoneNumber" class="form-control"/>
			</div>
			<div class="md-form">
				<label for="email"> Email</label>
				<form:input path="email" class="form-control"/>
			</div>
			<div class="md-form">
				<label for="address"> Address</label>
				<form:input path="address" class="form-control"/>
				
			<div class="md-form">
				<label for="password"> ADMIN PW</label>
				<form:password path="password" class="form-control"/>
				<form:errors cssClass="error"/>
			</div>
			
				<div class="row mt-3">
					<div class="col-md-2"></div>
					<div class="col-md-10">
						<button type="submit" class="btn btn-unique"> CHECK</button>
						<a href="../view/${member.userId}?page=${param.page}"
										class="btn btn-unique"> BACK</a>
					</div>
				
				</div>
			</div>
	</form:form>
</div>
</body>
</html>


