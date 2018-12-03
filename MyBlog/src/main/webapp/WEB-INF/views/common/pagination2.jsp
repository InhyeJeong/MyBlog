<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul
		class="pagination pagination-circle pg-dark justify-content-center my-5">
		<c:if test="${pagination.currentBlock > 1}">
			<li class="page-item"><a class="page-link" href="?page=1">처음</a>
			</li>
			<li class="page-item"><a class="page-link"
				href="?page=${pagination.prevBlockPage}">◀</a></li>
		</c:if>
		<c:if test="${pagination.page!=1}">
			<li class="page-item"><a class="page-link"
				href="?page=${pagination.page-1}"> <i
					class="fas fa-angle-double-left"></i></a></li>
		</c:if>
		<c:forEach var="cnt" begin="${pagination.startPage}"
			end="${pagination.endPage}">
			<li
				class="page-item <c:if test="${pagination.page==cnt}">active</c:if>">
				<a class="page-link" href="?page=${cnt}">${cnt}</a><!-- 상대경로로 주기 -->
			</li>
		</c:forEach>
		
		<c:if test="${pagination.page!=pagination.totalPage}">
			<li class="page-item"><a class="page-link"
				href="?page=${pagination.page+1}"> <i
					class="fas fa-angle-double-right"></i></a></li>
		</c:if>
		
		<c:if test="${pagination.currentBlock < pagination.totalBlock}">
			<li class="page-item"><a class="page-link"
				href="?page=${pagination.nextBlockPage}">▶</a></li>
			<li class="page-item"><a class="page-link"
				href="?page=${pagination.totalPage}">마지막</a></li>
		</c:if>
	</ul>
</body>
</html>