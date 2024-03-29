<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "x" uri = "http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link href="https://fonts.googleapis.com/css?family=Acme|Zilla+Slab&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link type = "text/css" rel = "stylesheet" href = "resources/css/main.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Acme|Ropa+Sans|Ubuntu|Zilla+Slab&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>

.loginmodal-container {
  padding: 30px;
  max-width: 350px;
  width: 100% !important;
  background-color: #F7F7F7;
  margin: 0 auto;
  border-radius: 2px;
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  overflow: hidden;
  font-family: roboto;
}

.loginmodal-container h1 {
  text-align: center;
  font-size: 2.5em;
  font-family: roboto;
}


.loginmodal {
  text-align: center;
  font-size: 14px;
  font-family: 'Arial', sans-serif;
  font-weight: 700;
  height: 36px;
  padding: 0 8px;
}

#loginConfirm {

  border: 0px;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1); 
  background-color: #4d90fe;
  font-family: roboto;
  font-size: 14px;
  
}

#loginConfirm:hover {
  border: 0px;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color: #357ae8;
 
}
.form-group .username  {
 	background-image: url(img/user.png);
  	background-position: 5px center;
  	background-size: 20px;
  	background-repeat:no-repeat;
  	padding-left: 40px;
  	width: 100%;
  	box-sizing: border-box;
}
.form-group .password {
 	background-image: url(img/lock.png);
  	background-position: 5px center;
  	background-size: 20px;
  	background-repeat:no-repeat;
  	padding-left: 40px;
  	width: 100%;
  	box-sizing: border-box;
}
.modal {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
 
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}
</style>

</head>
<body>

<header>
	<div class="container-fluid">
		<div class="row">
			<div class="col" id="menu2">
				<div id="logo">
               		<a href="home" alt="logo"><img src="img/logo1.jpg" width=400 align="center" /></a>
               		<!-- img src경로를 html등 다양한 곳에서 찾을수 있도록 절대경로를 줌. 정석은 해당페이지에서 자바스크립로 값변경을 해야함
               		추후에 도메인이 	 확정되었을때는 localhost:8443으로 해준것들을 다 변경해줘야함  -->
            	</div>   
               	<ul>
               		<li>
                  		<a title="검색" href="#" style="color:#B17B48;">
                     		<span class="glyphicon glyphicon-search"></span>
                  		</a>
               		</li>
               		<li>
                  		<a title="장바구니" href="cart" id="cart" style="color:#B17B48;">
                     		<span class="glyphicon glyphicon-shopping-cart"></span>
                  		</a>
               		</li>
               		<sec:authorize access="isAnonymous()">
               		<li>
                  		<a title="로그인" href="#" style="color:#B17B48;" id="login" data-toggle="modal" data-target="#login-modal">
                     		<span class="far fa-user">로그인</span>
                  		</a>
               		</li>
               		</sec:authorize>
               		<sec:authorize access="isAuthenticated()">
               		<li>
	               		<a href="#" onclick="document.getElementById('logout-form').submit();" id="logout" style="font-family:arial;"><i class="ri-logout-box-line"></i>로그아웃</a>
						<form id="logout-form" action="<c:url value='logout'/>" method="POST">
	   						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
					</li>
               		</sec:authorize>
               		<sec:authorize access="isAuthenticated()">
               		<li>
                  		<a href="myPage" style="color:#B17B48; font-family:arial; font-size:18px" id="myPage"><i class="ri-user-search-line"></i>마이페이지</a>
               		</li>
               		</sec:authorize>
               		<sec:authorize access="hasRole('ROLE_ADMIN')">
               		<li>
                  		<a href="admin_page" style="color:#B17B48; font-family:arial; font-size:18px;" id="myPage"><i class="ri-admin-line"></i>관리자</a>
               		</li>
               		</sec:authorize>
            	</ul>
            </div>
		</div>
	</div>
    
    <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;" data-backdrop="static">
          <div class="modal-dialog">
                <div class="loginmodal-container modal-content">
                    <h1>SUPLLEX</h1>
                  <form action="login" method="post" name="loginForm">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div class="form-group mt-5"><input type="text" class="username form-control" style="height:40px" placeholder="Username" required name="memId" id="memId"></div>
					<div class="form-group"><input type="password" class="password form-control" style="height:40px" placeholder="Password" required name="memPw" id="memPw"></div>
					<c:if test="${not empty ERRORMSG}">
	        			<font color="red">
	        			<p>${ERRORMSG }</p>
				        </font>
			    	</c:if>
					<div class="form-group text-center"><button type="submit" class="btn btn-dark form-control" style="height:50px; font-size:15px" id="loginConfirm">로그인</button></div>
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
     </div>


	<!-- 메뉴바 -->
	<div class="navbar" id="navbar">
		<a href="home" style="font-family:impact; font-size:25px;">HOME</a>
		<div class="subnav">
			<button class="subnavbtn" style="font-family:impact; font-size:25px;">SHOP <i class="fa fa-caret-down"></i></button>
			<div class="subnav-content">
				<a href="userList?bed" class = "userList" id="userBed" style="font-family:arial; font-size:20px;">BED</a>
				<a href="userList?table" class = "userList" id="userTable" style="font-family:arial; font-size:20px;">TABLE</a>
				<a href="userList?chair" class = "userList" id="userChair" style="font-family:arial; font-size:20px;">CHAIR</a>
				<a href="userList?sofa" class = "userList" id="userSofa" style="font-family:arial; font-size:20px;">SOFA</a>
				<a href="userList?bookshelf"  class = "userList" id="userBookshelf" style="font-family:arial; font-size:20px;">BOOKSHELF</a>
				<a href="userList?etc" class = "userList"  id="userEtc"  style="font-family:arial; font-size:20px;">ETC</a>
				
		
			</div>
		</div>
		<a href="about" id="about" style="font-family:impact; font-size:25px;" >ABOUT</a>
		<a href="contact_view" id="map" style="font-family:impact; font-size:25px;">CONTACT</a>
		
		<div class="subnav">
			<button class="subnavbtn" style="font-family:impact; font-size:25px;">COMMUNITY<i class="fa fa-caret-down"></i></button>
			<!-- <a href="memberList_view" style="font-family:impact; font-size:25px;">COMMUNITY</a> -->
			<div class="subnav-content">
				<a href="notice_list" class="community" id="community_notice" style="font-family:arial; font-size:20px;">NOTICE</a>
				<a href="qna_list" class="community" id="community_qna" style="font-family:arial; font-size:20px;">QnA</a>
			</div>
		</div>
	</div>
</header>

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
	var topBar = $("#navbar").offset();
	
	$(window).scroll(function(){
		if($(document).scrollTop()>=topBar.top)
		{	
			$("#navbar").css({
				position:"fixed",
				top:"0",
				width:"100%",
				margin:"0 auto"
			});
		}
		else
		{
			$("#navbar").css({
				position:"relative",
				top:""
			});
		}
	});
	$("#items").click(function(event){
		event.preventDefault();
		$("#main").load("admin_page");
	});
	
	$("#userBed").click(function(event){
		event.preventDefault();
		$("#main").load("userList?bed");
	});
	$("#userTable").click(function(event){
		event.preventDefault();
		$("#main").load("userList?table");
	});
	$("#userChair").click(function(event){
		event.preventDefault();
		$("#main").load("userList?chair");
	});
	$("#userSofa").click(function(event){
		event.preventDefault();
		$("#main").load("userList?sofa");
	});
	$("#userBookshelf").click(function(event){
		event.preventDefault();
		$("#main").load("userList?bookshelf");
	});
	$("#userEtc").click(function(event){
		event.preventDefault();
		$("#main").load("userList?etc");
	});
	
	/*
	$("#register_view").click(function(event){
		event.preventDefault();
		$("#main").load("register_view");
	});
	
	$("#register_list").click(function(event){
		event.preventDefault();
		$("#main").load("register_list");
	});*/
	/*
	$("#login").click(function(event){
		event.preventDefault();
		$("#main").load("login_view");
	});*/

	
	$("#about").click(function(event){
		event.preventDefault();
		$("#main").load("about");
	});
});


</script>



</body>








</html>