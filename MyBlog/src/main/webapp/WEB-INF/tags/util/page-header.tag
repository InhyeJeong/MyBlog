<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="icon" required="false" type="String" %>
<%@ attribute name="title" required="true" type="String" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<h1 style="font-style:italic; color:gray;"class="my-5">
	<c:if test="${not empty icon}">
		<i class="fas fa-${icon}"></i>
	</c:if>
	${title}
</h1>