<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- 추가 -->
<!-- Page Header -->
<header class="masthead"
	style="background-image: url('${context}/resources/img/home-bg.jpg')">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="site-heading">
					<h1>TONZ Blog</h1>
					<span class="subheading">Remember my BEAUTIFUL YOUTH</span>
				</div>
			</div>
		</div>
	</div>
</header>


<!-- Main Content -->

<div class="container">
	<!-- Add Button -->
	<c:if test="${not empty USER}">
	<div class="clearfix">
		<a class="btn btn-unique float-right" href="${context}/create">ADD
			&rarr;</a>
	</div>
	</c:if>
			
	<div class="row">
		<div class="col-lg-8 col-md-10 mx-auto">

			<c:forEach var="hboard" items="${list}" varStatus="status">
				
				<div class="post-preview">
					<a href="view/${hboard.hboardId}">
						<h2 class="post-title">${hboard.title}</h2>
						<h3 class="post-subtitle">${hboard.subtitle}</h3>
					</a>
					<p class="post-meta">
						Posted by
						<a href="#">
							${USER.userId}
						</a>
						
						 on ${hboard.strRegDate}
						

					</p>
				</div>
				<hr>
			</c:forEach>
			
			
		</div>
	</div>
</div>

<hr>

<!--Main layout-->