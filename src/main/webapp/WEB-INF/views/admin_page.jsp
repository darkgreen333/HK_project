<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>


<style>
#main {
  position: relative;
 
}

.text-block {
  position: absolute;
  bottom: 75%;
  right: 50%;
 /* background-color: black;*/
  color: white;
  padding-left: 20px;
  padding-right: 20px;
} 

img{
	position: relative;
}

.text-block h2 a{
	text-color : white;
	text-decoration: none;
}

.hero-text {
  text-align: center;
  position: absolute;
  top: 36%;
  left: 50%;
  botton:75%;
  transform: translate(-50%, -50%);
  color: white;
}

.hero-text button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 10px 25px;
  color: black;
  background-color: #ddd;
  text-align: center;
  cursor: pointer;
}

.hero-text button:hover {
  background-color: #555;
  color: white;
}
</style>
</head>
<body>
<!-- header -->
<%@ include file="header.jsp" %>





<section>
	<div id="main">
	 <img src="img/c10.jpg" alt="Nature" style="width:100%; height:800px;">	
		
    

  
  <div class="hero-image">
  <div class="hero-text">
    <h1 style="font-size:50px">ADMIN</h1>
	    <h4>supllex</h4>
	    <button id="register">상품 등록</button>&nbsp;&nbsp;
	    <button id="list">상품목록</button>
	    <br><br>
	    <button id="member">회원 관리</button>&nbsp;&nbsp;
	    <button id="order">주문관리</button>&nbsp;&nbsp;
	    <button id="notice">공지사항</button>
  </div>
</div>
	
	  </div>
</section>

<!-- footer -->
<%@ include file="footer.jsp" %>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!--angular js -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script>
$(document).ready(function(){
	$("#register").click(function(){
		event.preventDefault();
		location.href = "register_view";
	});
	
	$("#list").click(function(){
		event.preventDefault();;
		location.href = "register_list";
	});
	$("#member").click(function(){
		event.preventDefault();;
		location.href = "memberList_view";
	});
	$("#order").click(function(){
		event.preventDefault();;
		location.href = "adminOrder_view";
	});
	$("#notice").click(function() {
		event.preventDefault();
		location.href="notice_list";
	});
	
});

</script>

</body>
</html>