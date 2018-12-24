<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="context" value="${pageContext.request.contextPath}" scope="request"/>


<link rel="stylesheet" href="${context}/resources/css/main.css"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
</head>
<body>
<div class="container">
	<h1 class="my-5">
		<i class="fas fa-list-ol"></i> Member List
	</h1>
	
	<div class="my-3 text-right">
		
		[ Total : ${pagination.total} ]
	</div>
	
	<table class="table table-striped ">
		<thead>
			<tr>
				<th>No</th>
				<th>ID</th>
				<th>Name</th>
				<th>PhoneNumber</th>
				<th>Email</th>
				<th>Date</th>
			</tr>
		</thead>
	
		<tbody>
			<c:forEach var="item" items="${list}" varStatus="status">
				<fmt:formatDate var="regDate" value="${item.regDate}" pattern="yyyy-MM-dd"/>
				<tr>
					<td>${pagination.total - item.seq +1}</td>
					<td>
						<a href="view/${item.userId}?page=${page}">${item.userId }</a>
							<c:if test="${today==regDate}">
								<span class="badge badge-pill badge-danger">
									<i class="fas fa-tag"></i> New
								</span>
							</c:if>
					</td>
					
					<td>${item.name }</td>
					<td>${item.phoneNumber }</td>
					<td>${item.email }</td>
					<td>${regDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
		
		
	<jsp:include page="/WEB-INF/views/common/pagination2.jsp"/>
</div>

	<div class="text-center">
			<form action="search">
				Search:
				<select name="category">
					<option value="user_id">User ID</option>
					<option value="name">name</option>
					<option value="email">email</option>
				</select>
			
				<input type="text" name="keyword" required>
				<button type="submit"><i class="fas fa-search"></i></button>
			</form>
		</div>

</body>
</html>


