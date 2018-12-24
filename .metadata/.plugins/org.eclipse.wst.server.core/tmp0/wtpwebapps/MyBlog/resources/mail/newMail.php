<?php 


/* 클래스 파일 로드 */ 
include "Sendmail.php"; 


/* 
+ host : smtp 호스트 주소 
+ smtp_id : smtp 계정 아이디 
+ smtp_pw : smtp 계정 비번
+ debug : 디버그표시기능 [1 : 활성 0 : 비활성] 
+ charset : 문자 인코딩 
+ ctype : 메일 컨텐츠의 타입 */ 


$config=array( 
     'host'=>'ssl://smtp.gmail.com',
     'smtp_id'=>'example@gmail.com', 
     'smtp_pw'=>'password', 'debug'=>1, 
     'charset'=>'utf-8', 
     'ctype'=>'text/plain' 
); 
$sendmail = new Sendmail($config); 

?>
