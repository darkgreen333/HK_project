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
#write {
	text-align:right;
}
ul {
	list-style:none;
	margin:0;
	padding:0;
}
li{
	margin:0 0 0 0;
	padding:0 0 0 0;
	border:0;
	float:left;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<input type="hidden" name="noticePage" value="${noticePageMaker.npvo.noticePage}">
<input type="hidden" name="noticePerPageNum" value="${noticePageMaker.npvo.noticePerPageNum}">
<div class="container">
	<br/><br/><br/>
	<h3>NOTICE</h3>
	<br/>
	<hr/>
	<div class="container">
	<form id="jobForm">
		</form>
		<table class="table table-hover">
			<thead class="table-warning">
				<tr>
					<th>NO.</th>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>DATE</th>
				</tr>
			<c:forEach items="${notice_list}" var="dto">
			<tbody>
				<tr>
					<td>${dto.n_num}</td>
					<td><a href="notice_readPage?${noticePageMaker.noticeMakeSearch(noticePageMaker.npvo.noticePage)}&n_num=${dto.n_num}">${dto.n_title}</a></td>
					<td>${dto.n_writer}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.n_regdate}"/></td>
				</tr>
			</tbody>
			</c:forEach>
			
		</table>
		<br/>
		<div>
			<ul class="noticePagination">
				<c:if test="${noticePageMaker.noticePrev}">
					<li><a href="notice_list${noticePageMaker.noticeMakeSearch(noticePageMaker.noticeStartPage - 1)}">&laquo;</a></li>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
				
				<c:forEach begin="${noticePageMaker.noticeStartPage}" end="${noticePageMaker.noticeEndPage }" var="idx">
					<li><a href="notice_list${noticePageMaker.noticeMakeSearch(idx)}">${idx}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				</c:forEach>
				
				<c:if test="${noticePageMaker.noticeNext && noticePageMaker.noticeEndPage > 0}">
					<li><a href="notice_list${noticePageMaker.noticeMakeSearch(noticePageMaker.noticeEndPage + 1)}">&raquo;</a></li>
				</c:if>
				
			</ul>
		</div>
		<br/>
		<div>
			<p id="write"><a href="notice_register">새글쓰기</a></p>

			<select name="searchType">
				<option value="n" <c:out value="${npvo.noticeSearchType == null?'selected':''}"/>>---</option>
				<option value="t" <c:out value="${npvo.noticeSearchType eq 't'?'selected':''}"/>>제목</option>
				<option value="c" <c:out value="${npvo.noticeSearchType eq 'c'?'selected':''}"/>>내용</option>
				<option value="w" <c:out value="${npvo.noticeSearchType eq 'w'?'selected':''}"/>>작성자</option>
			</select>
			<input type="text" name="noticeKeyword" id="noticeKeywordInput" value="${npvo.noticeKeyword}">
			<a href="#" id="noticeSearchBtn"><span class="glyphicon glyphicon-search"></span></a>

		</div>
	</div>
</div>
<%@ include file="footer.jsp" %>




<script>
	$(document).ready(function(){

		$("#noticeSearchBtn").click(function(){
			self.location = "notice_list" + '${noticePageMaker.noticeMakeQuery(1)}' + "&noticeSearchType="
				+ $("select option:selected").val()
				+ "&noticeKeyword=" + encodeURIComponent($('#noticeKeywordInput').val());
		});
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