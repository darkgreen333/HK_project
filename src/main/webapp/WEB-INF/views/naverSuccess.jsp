<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="x"  uri="http://java.sun.com/jsp/jstl/xml" %> 
<%@ taglib prefix="sql"  uri="http://java.sun.com/jsp/jstl/sql" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
<style>
html, div, body, h3 {
	margin: 0;
	padding: 0;
}

h3 {
	display: inline-block;
	padding: 0.6em;
}
</style>
</head>
<body>

<div style="background-color: #15a181; width: 100%; height: 50px; text-align: center; color: white;">
	<h3>Naver_Login Success</h3>
</div>
<br>
<h2 style="text-align: center" id="name"></h2>
<h4 style="text-align: center" id="email"></h4>
<h4 style="text-align: center" id="etc"></h4>

<script	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var name = ${result}.response.name;
	var email = ${result}.response.email;
	$("#name").text("환영합니다. " + name + "님");
	$("#email").text(email);
});

$(function () {
    $("body").hide();
    $("body").fadeIn(1000);  // 1초 뒤에 사라 지자 
   
    setTimeout(function(){$("body").fadeOut(1000);},1000);
    setTimeout(function(){location.href= "${pageContext.request.contextPath}/"},2000);
//2초 뒤에 메인 화면 으로 가자  
  
});
</script>
</body>
</html>