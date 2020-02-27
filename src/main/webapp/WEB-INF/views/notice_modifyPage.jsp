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
</head>
<body>
<%@ include file="header.jsp" %>
<br/><br/>
<div class="container">
	<form role='form' method="post">
		<input type="hidden" name="n_num" value="${dto.n_num}">
		<input type="hidden" name="noticePage" value="${npvo.noticePage}">
		<input type="hidden" name="noticePerPageNum" value="${npvo.noticePerPageNum}">
		<input type="hidden" name="noticeSearchType" value="${npvo.noticeSearchType}">
		<input type="hidden" name="noticeKeyword" value="${npvo.noticeKeyword}">
	</form>
		<c:forEach items="${notice_list}" var="dto">
		<c:if test="${n_num eq dto.n_num}">
		<form action="notice_modify" method="post" enctype="multipart/form-data">
		<div class="box-body">
			<input type="hidden" name="n_num" value="${dto.n_num }">
			<div class="form-group">
				<label for="title">제목</label>
				<input type="text" name="n_title" class="form-control" value="${dto.n_title }">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea name="n_content" class="form-control" rows="20">${dto.n_content }</textarea>
			</div>
		</div>
		<div id="fileDiv">
			<p>
				<input type="file" class="form-control" id="n_img" name="n_img" style="border:0px solid black;"/>
			</p> 
		</div>
		<br/>
		<div>
			<button type="submit" class="btn btn-info">수정</button>
		</div>
		</form>
		<hr/>
		</c:if>
		</c:forEach>
</div>	
<br/><br/>
<%@ include file="footer.jsp" %>
<script>
/*
	$(document).ready(function(){
		
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		$(".btn-warning").on("click", function(){
			self.location =  "/notice_list?noticePage=${npvo.noticePage}&noticePerPageNum=${npvo.noticePerPageNum}"
					+ "&noticeSearchType=${npvo.noticeSearchType}&noticeKeyword=${npvo.noticeKeyword}";
		});
	});
*/	
</script>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>