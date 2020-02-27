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
<br/><br/><br/><br/><br/>
<div class="container">
	<h2>공지사항 / 새 글 쓰기</h2>


	<form action="notice_register" method="post" enctype="multipart/form-data">
		<!-- <input type="hidden" name="n_num" value="${dto.n_num }">-->
		<div class="box-body">
			<div class="form-group">
				<label for="title">제목</label>
				<input type="text" name="n_title" class="form-control" placeholder="제목을 입력해주세요">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea name="n_content" class="form-control" rows="20" placeholder="내용을 입력해주세요"></textarea>
			</div>
		</div>
		<div id="fileDiv">
			<p>
				<input type="file" id="n_img" name="n_img" style="border:0px solid black;"/>
			</p> 
		</div>
		<br/>
		<div class="box-footer">
			<button type="submit" class="btn_ok">SUBMIT</button>
		</div>
	</form>
	<hr/>
</div>
<br/><br/>
<%@ include file="footer.jsp" %>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>