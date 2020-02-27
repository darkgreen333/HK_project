<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<style>

.modal-header {
	text-align:center;
	margin-bottom:25px;
	font-size:50px;
	color:#d2a679;
}
a {
	color:grey;
}
#wrap {
	width:100%;
}
input[type="text"] {
 	background-image: url(img/user.png);
  	background-position: 5px center;
  	background-size: 20px;
  	background-repeat:no-repeat;
  	padding-left: 40px;
  	width: 100%;
  	box-sizing: border-box;
}
input[type="password"] {
 	background-image: url(img/lock.png);
  	background-position: 5px center;
  	background-size: 20px;
  	background-repeat:no-repeat;
  	padding-left: 40px;
  	width: 100%;
  	box-sizing: border-box;
}
</style>
</head>
<body>
	
<%@ include file="header.jsp" %>

<section>
	<div id="main">

<div class="loginPage container" style="width:400px">
				<form action="login" method="post" name="loginForm">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /><br/>
					<div class="modal-header" style="width:400px">
						<div id="wrap">
						<h1 class="modal-title">SUPLLEX</h1>
						</div>
						<hr>
					</div>
					<div class="form-group"><input type="text" class="form-control" style="width:400px" placeholder="Username" required name="memId" id="memberId"></div>
					<div class="form-group"><input type="password" class="form-control" style="width:400px" placeholder="Password" required name="memPw" id="memberPw"></div>
					<c:if test="${not empty ERRORMSG}">
	        			<font color="red">
	        			<p>${ERRORMSG }</p>
				        </font>
			    	</c:if>
					<div class="form-group text-center"><button type="submit" class="btn btn-dark form-control" style="width:100%">로그인</button></div>
					<div class="form-group text-center"><a href="pwSearch"><i class="fas fa-search"></i>아이디/비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="join_view"><i class="fas fa-user-plus"></i>회원가입</a></div>
					
				</form>
				<div id="naver_id_login" style="text-align:center">
					<a href="nlogin"><img width="223" src="img/naver_login_button.jpg"/></a>
				</div>
				<br/>
				<div id="google_id_login" style="text-align:center">
					<a href="glogin"><img width="223" src="img/google_login_button.jpg"/></a>
				</div>
</div>
	</div>
</section>
<%@ include file="footer.jsp" %>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>