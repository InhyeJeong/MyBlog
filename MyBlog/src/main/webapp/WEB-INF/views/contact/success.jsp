<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="context" value="${pageContext.request.contextPath}"
	scope="request" />
<link rel="stylesheet" href="${context}/resources/css/main.css" />
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Email Sending Success</title>
</head>
<body>
	<iot:page-animate-header title="Email Sending Success !" />
</body>
</html>


