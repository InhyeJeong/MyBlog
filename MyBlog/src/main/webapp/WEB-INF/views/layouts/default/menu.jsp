<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="context" value="${pageContext.request.contextPath}" scope="request"/>
<!--메뉴css경로 : clean-blog.min.css  -->
 <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand" href="${context}/">TONZs-BLOG</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
          
          <!-- 로그인 안한 사용자 -->
			<c:if test="${empty USER}">
				<li class="nav-item">
					<a class="nav-link hint" href="${context}/account/login"> <i class="fas fa-sign-out-alt"></i> ONLY ADMIN LOGIN</a>
				</li>
			</c:if>
            <li class="nav-item">
              <a class="nav-link" href="${context}/">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${context}/about/view">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${context}/gallery/list">Gallery</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${context}/contact/mailForm">Contact</a>
            </li>
          
           
			
			<!-- 로그인 사용자 -->
				
				<c:if test="${not empty USER}">
				
					<!--아바타  -->
					<li class="nav-item">
						<a class="nav-link" href="#">
	
								login success : ${USER.userId}
						</a>
					</li>
					
				
					<li class="nav-item">
						<a class="nav-link" href="${context}/account/logout">LOGOUT</a>
					</li>
				</c:if>

          </ul>
        </div>
        
        
        
        
      </div>
    </nav>

