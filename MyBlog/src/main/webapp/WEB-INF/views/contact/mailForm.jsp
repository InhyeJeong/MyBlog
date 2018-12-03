<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="context" value="${pageContext.request.contextPath}"
	scope="request" />
<link rel="stylesheet" href="${context}/resources/css/main.css" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<body>


	<!-- Page Header -->
	<header class="masthead"
		style="background-image: url('${context}/resources/img/contact-bg.jpg')">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="page-heading">
						<h1>Contact Me</h1>
						<span class="subheading">Have questions? I have answers.</span>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Main Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<p>Want to get in touch? Fill out the form below to send me a
					message and I will get back to you as soon as possible!</p>
				<!-- Contact Form - Enter your email address on line 19 of the mail/contact_me.php file to make this form work. -->
				<!-- WARNING: Some web hosts do not allow emails to be sent through forms to common mail hosts like Gmail or Yahoo. It's recommended that you use a private domain email address! -->
				<!-- To use the contact form, your site must be on a live web host with PHP! The form will not work locally! -->
				<form action="${pageContext.request.contextPath}/contact/mailSend" 
					method="post" name="sentMessage" id="contactForm" novalidate>
		
				
				
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<label>Name</label> <input type="text" class="form-control"
								placeholder="Name" id="name" required
								data-validation-required-message="Please enter your name.">
							<p class="help-block text-danger"></p>
							<form:errors path="phoneNumber" element="div" cssClass="error"/>
						</div>
					</div>
					
					<!-- 받는 사람 이메일 -->
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<label>Email Address</label> <input name="receiver" type="email"
								class="form-control" placeholder="abc@abc.com" id="email"
								required
								data-validation-required-message="Please enter your email address.">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					
					
					<!-- 전화번호 -->
					<div class="control-group">
						<div
							class="form-group col-xs-12 floating-label-form-group controls">
							<label>Phone Number</label> <input type="tel"
								class="form-control" placeholder="Phone Number" id="phone"
								required
								data-validation-required-message="Please enter your phone number.">
							<p class="help-block text-danger"></p>
							<form:errors path="phoneNumber" element="div" cssClass="error"/>
						</div>
					</div>
					
					
					<!-- 제목 -->
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<label>Title</label> <input type="text" name="title"
								class="form-control" placeholder="Title" id="title"
								required
								data-validation-required-message="Please enter a Title.">
							
							<p class="help-block text-danger"></p>
						</div>
					</div>
					
					
					<!-- 내용 -->
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<label>Message</label>
							<textarea name="content" rows="5" cols="30" class="form-control" placeholder="Message"
								id="message" required
								data-validation-required-message="Please enter a message."></textarea>
							<p class="help-block text-danger"></p>
						</div>
					</div>
					
					
					
					<br>
					<div id="success"></div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary" disabled
							id="sendMessageButton">Send</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<hr>
<%-- 	<div class="container">
		<h4>메일 보내기</h4>
		<form action="${pageContext.request.contextPath}/mail/mailSending"
			method="post">
			<div align="center">
				<!-- 받는 사람 이메일 -->
				<input type="text" name="tomail" size="120" style="width: 100%"
					placeholder="상대의 이메일" class="form-control">
			</div>
			<div align="center">
				<!-- 제목 -->
				<input type="text" name="title" size="120" style="width: 100%"
					placeholder="제목을 입력해주세요" class="form-control">
			</div>
			<p>
			<div align="center">
				<!-- 내용 -->
				<textarea name="content" cols="120" rows="12"
					style="width: 100%; resize: none" placeholder="내용#"
					class="form-control"></textarea>
			</div>
			<p>
			<div align="center">
				<input type="submit" value="메일 보내기" class="btn btn-warning">
			</div>
		</form>
	</div> --%>


</body>
</html>


