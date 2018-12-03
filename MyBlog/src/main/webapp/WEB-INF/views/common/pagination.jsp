<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="context" value="${pageContext.request.contextPath}" scope="request"/>
<link rel="stylesheet" href="${context}/resources/css/main.css"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- pagination -->
		<ul class="pagination pagination-circle pg-dark mb-0 justify-content-center" style="margin:20px 0; ">
		
			<c:if test="${page!=1}">
				<li class="page-item ">
					<a class="page-link" href="?page=${page-1}">
						<i class="fas fa-angle-double-left"></i> Previous
					</a>
				</li>
			</c:if>
			
			  <c:forEach var="cnt" begin="1" end="${totalPage}"> <!--end = "10"하드코딩에서 util메서드 추가한후 범용적인 totalPage로 바꿈  -->
			  <!-- page번호를 스코프에 담아서 만든다 :page==${cnt} -->
			  
				  <li class="page-item <c:if test="${page==cnt}">active</c:if>">
				  	<a class="page-link" href="?page=${cnt}">${cnt}</a><!-- 상대경로로 주기 -->
				  </li>
			  </c:forEach>
			  
			<c:if test="${page!=totalPage }">
				<li class="page-item">
			  		<a class="page-link" href="?page=${page+1}">
			  			Next <i class="fas fa-angle-double-right"></i>
		  			</a>
				</li>
			</c:if>
			
		</ul>

</body>
</html>


 --%>