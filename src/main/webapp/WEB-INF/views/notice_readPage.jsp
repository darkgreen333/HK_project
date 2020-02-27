<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "x" uri = "http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content = "IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Insert title here</title>
<style>
#a {
text-align:right;
}
div.content {
	text-align:center;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<br/><br/>
<c:forEach items="${notice_list}" var="dto">
<c:if test="${n_num eq dto.n_num}">
<div class="container">
	<form role="form" method="post" action="noticeModifyPage">
		<input type="hidden" name="n_num" value="${dto.n_num}">
		<input type="hidden" name="noticePage" value="${npvo.noticePage}">
		<input type="hidden" name="noticePerPageNum" value="${npvo.noticePerPageNum}">
		<input type="hidden" name="noticeSearchType" value="${npvo.noticeSearchType}">
		<input type="hidden" name="noticeKeyword" value="${npvo.noticeKeyword}">
	<div class="container">
		<div class="container">
			<h3 class="card-title mb-3">${dto.n_title}</h3>
			<hr/>
			<div class="view-info">
				<span class="view-author">작성자 : ${dto.n_writer}</span>
				<span class="view-date" style="float:right">작성일자 : ${dto.n_regdate}</span>
				<br/><hr/>
			</div>
		</div>
		<div class="container" id="content">
			<img src="upload/${dto.n_img }"> <br/><br/>
			<p style="text-align:center">${dto.n_content}</p>
		</div>
		<br/><hr/>
	</div>
	</form>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div>
			<a href="notice_modifyPage?n_num=${n_num}">수정</a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="notice_removePage?n_num=${dto.n_num }">삭제</a>
			<a href="notice_list">목록</a>
		</div>
	</sec:authorize>
</div>
</c:if>
</c:forEach>
<br/><br/>
<%@ include file="footer.jsp" %>

<script>
	$(document).ready(function(){
		/*
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		$(".modifyBtn").on("click", function(){
			formObj.attr("method", "get");
			formObj.attr("action", "notice_modifyPage");
			formObj.submit();
		});
		$(".removeBtn").on("click", function(){
			formObj.attr("action", "notice_removePage");
			formObj.submit();
		});
		$(".goListBtn").on("click", function(){
			formObj.attr("method", "get");
			formObj.attr("action", "notice_list");
			formObj.submit();
		});
		*/
		/*
		$("#modifyBtn").click(function() {
			event.prevendDefault();
			location.href="notice_modifyPage?n_num=" + ${dto.n_num};
		});
		*/
	});
</script>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>