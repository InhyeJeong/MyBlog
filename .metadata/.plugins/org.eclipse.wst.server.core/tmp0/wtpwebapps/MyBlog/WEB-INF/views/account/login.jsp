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
<title>LOGIN PAGE</title>
</head>
<body>
<br>
<div class="row">
	
	<div class="col-md-6 offset-md-3"> <!-- 컬럼 6개 사용, 좌우 md 3이 있는 효과(중앙배치)-->
		
		<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>
		<iot:page-animate-header  title=" ONLY ADMIN LOGIN"/>
		
		
		<!--로그인 모델 추가후, 인터셉터를 이용한 로그인 처리  -->
			<c:if test="${not empty login.url}">
				<div class="alert alert-warning">
		<!--reason을 모델 추가-->
					<strong>${login.reason }</strong>
				</div>
			</c:if>
			
			<form:form commandName="login">
				<form:hidden path="url"/>
			
			
			<div class="md-form">
				<form:input path="userId" class="form-control"/>
				<label for="userId"> USER ID </label>
			</div>
			
			<div class="md-form">
				<form:input path="password" class="form-control"/>
				<label for="password"> PASSWORD </label>
			</div>
		<div class="error">${error}</div>
			<button class="btn btn-unique btn-block my-4" type="submit"> LOGIN </button>
		</form:form>			
	
	</div>


</div>


</body>
</html>


