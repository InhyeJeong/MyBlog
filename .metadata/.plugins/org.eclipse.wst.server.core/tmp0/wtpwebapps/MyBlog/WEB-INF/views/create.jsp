<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="context" value="${pageContext.request.contextPath}" scope="request"/>
<link rel="stylesheet" href="${context}/resources/css/main.css"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CREATE</title>

<script src="${context}/resources/bower_components/tinymce/tinymce.min.js"></script>
 <!-- jquery load -->

 <script type="text/javascript" src="${context}/resources/bower_components/jquery/dist/jquery.js"></script>



<script>
	$(function(){
		tinymce.init({
		    selector: "textarea",
		    height:400,
		    plugins : "autolink autosave code link media image table textcolor autoresize",
			toolbar: "mybutton | undo redo | forecolor bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | table link media custom_image code ",
		    
		    setup: function(editor) {
		        editor.addButton('mybutton', {
		            text:"IMG",
		            icon: false,
		            onclick: function(e) {
			                console.log($(e.target));
			                //	BUTTON
			                if($(e.target).prop("tagName") == 'BUTTON'){
								console.log($(e.target).parent().parent().find('input').attr('id'));                    
								if($(e.target).parent().parent().find('input').attr('id') != 'tinymce-uploader') {
									$(e.target).parent()
												.parent()
												.append('<input id="tinymce-uploader" type="file" name="pic" accept="image/*" style="display:none">');
				                }
				                $('#tinymce-uploader').trigger('click');
				                $('#tinymce-uploader').change(function(){
				                 	var input, file, fr, img;
				
						            if (typeof window.FileReader !== 'function') {
						                write("The file API isn't supported on this browser yet.");
						                return;
						            }
				
						            input = document.getElementById('tinymce-uploader');
						            
						            if (!input) {
						                write("Um, couldn't find the imgfile element.");
						            }
						            else if (!input.files) {
						                write("This browser doesn't seem to support the `files` property of file inputs.");
						            }
						            else if (!input.files[0]) {
						                write("Please select a file before clicking 'Load'");
						            }
						            else {
						                file = input.files[0];
						                fr = new FileReader();
						                fr.onload = createImage;
						                fr.readAsDataURL(file);
						            }
				
						            function createImage() {
						                img = new Image();
						                img.src = fr.result;
						                editor.insertContent('<img src="'+img.src+'"/>');
						            }
				                });
			            }
			                
			                
			           //	DIV
			            if($(e.target).prop("tagName") == 'DIV'){
				           	if($(e.target).parent().find('input').attr('id') != 'tinymce-uploader') {
				 				console.log($(e.target).parent().find('input').attr('id'));                                
				                $(e.target).parent().append('<input id="tinymce-uploader" type="file" name="pic" accept="image/*" style="display:none">');
				            }
				           	
			                $('#tinymce-uploader').trigger('click');
			                $('#tinymce-uploader').change(function(){
			                 	var input, file, fr, img;
	
					            if (typeof window.FileReader !== 'function') {
					                write("The file API isn't supported on this browser yet.");
					                return;
					            }
			
					            input = document.getElementById('tinymce-uploader');
					            if (!input) {
					                write("Um, couldn't find the imgfile element.");
					            }
					            else if (!input.files) {
					                write("This browser doesn't seem to support the `files` property of file inputs.");
					            }
					            else if (!input.files[0]) {
					                write("Please select a file before clicking 'Load'");
					            }
					            else {
					                file = input.files[0];
					                fr = new FileReader();
					                fr.onload = createImage;
					                fr.readAsDataURL(file);
					            }
			
					            function createImage() {
					                img = new Image();
					                img.src = fr.result;
					                 editor.insertContent('<img src="'+img.src+'"/>');
					                
					            }
			               
			             });
		               
			           }
			           //	I
			           if($(e.target).prop("tagName") == 'I'){
							console.log($(e.target).parent().parent().parent().find('input').attr('id'));
							if($(e.target).parent().parent().parent().find('input').attr('id') != 'tinymce-uploader') {
								$(e.target).parent()
											.parent()
											.parent()
											.append('<input id="tinymce-uploader" type="file" name="pic" accept="image/*" style="display:none">');
				            }
			                $('#tinymce-uploader').trigger('click');
			                
			                $('#tinymce-uploader').change(function(){
			                 	var input, file, fr, img;
			
					            if (typeof window.FileReader !== 'function') {
					                write("The file API isn't supported on this browser yet.");
					                return;
					            }
			
					            input = document.getElementById('tinymce-uploader');
					            if (!input) {
					                write("Um, couldn't find the imgfile element.");
					            }
					            else if (!input.files) {
					                write("This browser doesn't seem to support the `files` property of file inputs.");
					            }
					            else if (!input.files[0]) {
					                write("Please select a file before clicking 'Load'");
					            }
					            else {
					                file = input.files[0];
					                fr = new FileReader();
					                fr.onload = createImage;
					                fr.readAsDataURL(file);
					            }
			
					            function createImage() {
					                img = new Image();
					                img.src = fr.result;
					                 editor.insertContent('<img src="'+img.src+'"/>');   
					            }
					            
			                });
			            }
		            }	//onclick
		        });	//	editor 
		    }	//	setup
		});	//	tinymce


	})
</script>
</head>


<body>
	<br>
	<h2 class="mt-5 mb-4"> POSTING </h2>
	
	<form:form commandName="hboard"  >
		<input type="hidden" name="writer" value="${hboard.hboardId}"/>
		<div class="md-form">
			<label> Title</label>
			<form:input path="title" class="form-control"/>
			<form:errors path="title"/>
		</div>
		
		<div class="md-form">
			<label> SubTitle</label>
			<form:input path="subtitle" class="form-control"/>
			<form:errors path="subtitle"/>
		</div>
		
		<br>
		<div class="mb-3">
			<label>WRITER : TONZ</label>
		</div>
		
		
		
		<form:textarea path="content"/>
		
		<div class="text-center mt-3">
			<button type="submit" class="btn btn-unique btn-md">
				<i class="fas fa-check mr-2"></i> CHECH</button>
			<a href="#" onclick="history.back()" class="btn btn-unique btn-md">
				<i class="fas fa-undo mr-2"></i> BACK</a>

		</div>
		
	</form:form>

</body>
</html>


