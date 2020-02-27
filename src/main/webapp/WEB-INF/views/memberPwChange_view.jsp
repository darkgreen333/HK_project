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
<style>
legend {
    color: blue;
    width:160px;
    margin-left:30px;
}
fieldset {
	width:50%;
	border: 5px solid grey;
	margin-left:auto;
	margin-right:auto;
}
label {
	font-size:20px;
	display:inline;
	width:20px;
	margin-left:50px;
}
</style>
</head>
<body>

<%@ include file="header.jsp" %>
<section>
	<div id="main">
		<div class="container mt-5">
			<form action="memberPwChange" method="post" id="memberPwForm">
				<fieldset style="width:50%;border:5px solid grey; margin-left:auto; margin-right:auto">
					<legend style="width:160px;margin-left:30px">비밀번호 변경</legend><br/>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<label style="font-size:20px;display:inline;width:20px;margin-left:50px">새 비밀번호 &nbsp;&nbsp;<input style="display:inline" class="form-control col-6" type="password" id="memberPw" name="memPw" required/></label><br/><br/>
					<label style="font-size:20px;display:inline;width:20px;margin-left:50px">새 비밀번호 확인 &nbsp;&nbsp;<input style="display:inline" class="form-control col-6" type="password" id="memberPw2" name="memPw2" required/></label><br/><br/>
					<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
					<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
					<div style="text-align:center">
						<button type="submit" class="btn btn-primary mr-3" id="change">변경</button>
						<button class="btn btn-primary" id="cancle">취소</button>
					</div><br/>
				</fieldset>
			</form>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$(document).ready(function(e){
	$("#alert-success").hide();
	$("#alert-danger").hide();
	$("input").keyup(function(){
		var pw1 = $("#memberPw").val();
		var pw2 = $("#memberPw2").val();
		if(pw1 != "" || pw2 != "") {
			if(pw1 == pw2) {
				$("#alert-success").show();
				$("#alert-danger").hide();
				$("#change").removeAttr("disabled");
			}else {
				$("#alert-success").hide();
				$("#alert-danger").show();
				$("#change").attr("disabled", true);
			}
		}
	});
	$("#change").click(function(e){
		if($("#memberPw").val()==""){
			swal({
				title:"비밀번호를 입력하세요.",
				icon:"info"
			}).then((value) => {
				$("#memberPw").focus();
			});
			return false;
		}
		if($("#memberPw2").val()==""){
			$("#memberPw2").focus();
			alert("비밀번호를 입력하세요.");
			return false;
		}
		else {
			swal("변경되었습니다", "변경된 비밀번호로 다시 로그인 해주세요.", "success").then((value) => {
				e.preventDefault();
				if(value) {
					$("#memberPwForm").submit();
				}
			});
		}
	});
	$("#cancle").click(function(){
		location.href="myPage";
	});
});
</script>
</body>
</html>