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
 body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
 ul { 
 	padding:0; 
 	margin:0; 
 	list-style:none;  
}




 section#container { 
 	padding:20px 0; 
 	border-top:2px solid #eee; 
 	border-bottom:2px solid #eee; 
 }
 section#container::after {
 	content:""; 
 	display:block; 
 	clear:both; 
 }
 aside { 
 	float:left; 
 	width:200px; 
 }
 div#container_box { 
 	float:right; 
 	width:calc(100% - 200px - 20px); 
 }
 
 aside ul li { 
 	text-align:center; 
 	margin-bottom:10px; 
 }
 aside ul li a { 
 	display:block; 
 	width:100%; 
 	padding:10px 0;
 }
 aside ul li a:hover { 
 	background:#eee; 
 }
 

</style>
</head>
<body>
<!-- header -->
<%@ include file="header.jsp" %>



<h1>관리자 페이지</h1>

<section id="container">
	<aside>
		<%--<%@ include file ="aside.jsp" %>   --%>
		<ul>
			<li><a href="register_view" id="register_view">상품 등록</a></li>
			<li><a href="register_list" id="register_list">상품 목록</a></li>
			
		</ul>
	</aside>
	

	<div id="container_box">
	
	</div>
	<br><Br><br><Br><br><Br><br><Br><br><Br><br><Br><br><Br><br><Br><br><Br><br><Br><br><Br><br><Br>
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


</body>
</html>