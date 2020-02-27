<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "x" uri = "http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content = "IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
section#content ul li {
	display:inline-block;
	margin:7px;
}
section#content div.items_image img{
	width:250px;
	height:250px;
}
section#content div.items_name {
	padding:15px 0;
	text-align:center;
}
section#content div.items_name a{
	color :#000;
}
section#content div.items_price {
	margin-top:-18px;
	padding:10px 0;
	text-align:center;

}
#category {
	color : #606060;
}
</style>
</head>
<body>

	


<section>
	<div id="container_box" class="container">
		<section id="content">
		<Br>
			<h3 id="category"></h3>
			<Br>
			<ul>
				<c:forEach items="${userList}" var="userList">
				<li id="li">
					<div class="items_image">
						<a href="user_view?n=${userList.items_code}" ><img src="upload/${userList.items_image}"></a>
					</div>
					
					<div class="items_name">
						<a href="user_view?n=${userList.items_code}">${userList.items_name}</a>
					</div>
					<div class="items_price">
						<a href="user_view?n=${userList.items_code}">
						<span><fmt:formatNumber value="${userList.items_price}" pattern="###,###,###"/></span>원
						</a>
					</div>
				</li>
				</c:forEach>
			</ul>
		


	</section>

	</div>
</section>









<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!--angular js -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script>
$(document).ready(function() {
   <c:choose>
	   <c:when test="${not empty bed}">	//not empty 값이 있는가  || //model.addAttribute("bed", "bed");의 key값
	   		$("#category").text("BED");
	   </c:when>
	   
	   <c:when test="${not empty table }">
	   		$("#category").text("TABLE");
	   </c:when>
	   
	   <c:when test="${not empty chair}">
	   		$("#category").text("CHAIR");
	   </c:when>
	   
	   <c:when test="${not empty sofa}">
	   		$("#category").text("SOFA");
	   </c:when>
	   
	   <c:when test="${not empty bookshelf}">
	   		$("#category").text("BOOKSHELF");
	   </c:when>
	   
	   <c:when test="${not empty etc}">
	   		$("#category").text("ETC");
	   </c:when>
	   
	   
   </c:choose>
});
</script>

</body>
</html>