<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:set var="context" value="${pageContext.request.contextPath}"
	scope="request" />
<link rel="stylesheet" href="${context}/resources/css/main.css" />

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${context}/resources/favicon/tonz_favicon.ico">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>TONZs-BLOG</title>


<!-- 경로설정 !!!! -->

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<!-- Bootstrap core CSS -->
<link
	href="${context}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Material Design Bootstrap -->
<link
	href="${context}/resources/bower_components/MDBootstrap/css/mdb.min.css"
	rel="stylesheet">

<!-- Your custom styles (optional) -->
<link href="${context}/resources/css/main.css" rel="stylesheet">

<!-- JQuery -->
<script type="text/javascript"
	src="${context}/resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript"
	src="${context}/resources/bower_components/popper.js/dist/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript"
	src="${context}/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>




<!--새로추가  -->
<!-- Bootstrap core CSS -->
<link href="${context}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="${context}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="${context}/resources/css/clean-blog.min.css"
	rel="stylesheet">



</head>
<body>



	<!--★★★기본골격★★★  -->

	<!--★Main Navigation★-->
	<header>

		<tiles:insertAttribute name="menu" />

	</header>
	<!--Main Navigation-->




	<!--★Main layout★-->
	<main> 
		
			<tiles:insertAttribute name="body" />
		
	</main>
	<!--Main layout-->



	<!--★Footer★-->
	<footer>

		<tiles:insertAttribute name="footer" />

	</footer>
	<!--Footer-->
<!-- Bootstrap core JavaScript -->
<script src="${context}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${context}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Custom scripts for this template -->
<script src="${context}/resources/js/clean-blog.min.js"></script>
</body>
<!-- MDB core JavaScript : 반드시 body태그 뒤에 위치해야함!!! -->




</html>


