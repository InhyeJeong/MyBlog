<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
		<h1 class="my-5">
			<i class="fas fa-list-ol"></i> USER LIST
		</h1>
		<div class="my-3 text-right">( Total : ${total} )</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>No</th>
					<th>Id</th>
					<th>Name</th>
					<th>Phone number</th>
					<th>Email</th>
					<th>Date</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="item" items="${list}" varStatus="status">
					<fmt:formatDate var="regDate" value="${item.regDate}"
						pattern="yyyy-MM-dd" />
					<tr>
						<td>${total -
						status.index}</td>
						<td><a href="view/${item.userId}">${item.userId}</a>
							<c:if test="${today==regDate}">
								<span class="badge badge-pill badge-danger"> new</span>
							</c:if></td>
						<td>${item.name}</td>
						<td>${item.phoneNumber}</td>
						<td>${item.email}</td>
						<td>${regDate}</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
	
		<div class="text-center">
			<form action="search">
				Search:
				<select name="category">
					<option value="user_id">USER ID</option>
					<option value="name">Name</option>
					<option value="email">email</option>
				</select>
			
				<input type="text" name="keyword" required>
				<button type="submit"><i class="fas fa-search"></i></button>
			</form>
		</div>
</body>
</html>