<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
</head>
<body>

<%@ include file="header.jsp" %>
<section>
	<div id="main">
		<section class="container">
			<form action="memberDelete" method="post" id="delForm">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class="form-group">
					<label class="control-label" for="memId">아이디</label>
					<sec:authentication property="principal.username" var="memId" />
					<input class="form-control col-3" type="text" id="memberId" name="memId" value="${memId}" readonly="readonly"/>
				</div>
				<div class="form-group">
					<label class="control-label" for="memPw">패스워드</label>
					<input class="form-control col-3" type="password" id="memberPw" name="memPw" />
				</div>
			</form>
				<div class="form-group">
					<button class="btn btn-outline-dark" type="button" id="submit">회원탈퇴</button>
					<button class="cencle btn btn-outline-dark" type="button">취소</button>
				</div>
		</section>
	</div>
</section>
<%@ include file="footer.jsp" %>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$(document).ready(function(){
	// 취소
	$(".cencle").click(function(){
		
		location.href = "myPage";
				    
	});

	$("#submit").on("click", function(){
		if($("#memberPw").val()==""){
			swal({
				title: "비밀번호를 입력하세요.",
				icon: "info"
			}).then((value) => {
				$("#memberPw").focus();
			});
			return false;
		}
		$.ajax({
			url : "pwCheck",
			type : "POST",
			dataType : "json",
			data : $("#delForm").serializeArray(),
			success: function(data){
				if(data==false){
					swal({
						title:"비밀번호가 맞지않습니다.",
						icon:"info"
					}).then((value) => {
						$("#memberPw").focus();
					});
					return false;
				}else{
					swal({
						title: "정말 탈퇴하시겠습니까?",
						icon: "warning",
						buttons: ["취소","확인"]
					}).then((확인) => {
						if(확인) {
							swal({
								title: "탈퇴되었습니다.",
								text: "저희 SUPLLEX를 이용해 주셔서 감사합니다.",
								icon: "success",
								button: "확인"
							}).then((확인) => {
								$("#delForm").submit();
							});
						}
					});
				}
			}
		})
	});
});
</script>
</body>
</html>