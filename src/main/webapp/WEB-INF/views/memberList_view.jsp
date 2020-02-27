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

</style>
</head>
<body>


<!-- header -->
<%@ include file="header.jsp" %>

<section>

	<div id="main">


<div class="container mt-5">
	<input class="form-control-lg mb-5" id="search" type="text" placeholder="ID Search..">
	<table class="table table-hover table-success table-striped">
		<thead>
			<tr class="text-center">
				<th>아이디</th>
				<th>이름</th>
				<th>등급</th>
				<th>연락처</th>
				<th>주소</th>
				<th>이메일</th>
				<th>가입날짜</th>
				<th></th>
			</tr>
		</thead>
		<c:forEach var="list" items="${list}">
		<tbody id="tbody">
			<tr class="text-center">
				<td>${list.memId}</td>
				<td>${list.memName}</td>
				<td><c:if test="${list.memLevel eq 'ROLE_ADMIN'}">관리자</c:if><c:if test="${list.memLevel eq 'ROLE_USER'}">회원</c:if></td>
				<td>${list.memPhone}</td>
				<td>${list.memAdd1}&nbsp;&nbsp;${list.memAdd2}&nbsp;&nbsp;${list.memAdd3}</td>
				<td>${list.memEmail}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd E" value="${list.regDate}" /></td>
				<td><button class="btn btn-info btn-sm" id="modify" data-toggle="modal" data-target="#exampleModal">수정</button><button class="btn btn-danger btn-sm">삭제</button></td>
			</tr>
		</tbody>
		</c:forEach>
	</table>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">정보수정</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="adminUpdate" method="post">
            	<div class="modal-body">
            		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            		<table>
            			<tr class="text-center">
                			<td>아이디</td>
                			<td><input type="text" class="form-control" id="memberId" name="memId" readonly/></td>
                		</tr>
                		<tr>
                			<td>이름</td>
                			<td><input type="text" class="form-control" id="memName" name="memName" /></td>
                		</tr>
                		<tr>
                			<td>등급</td>
                			<td><select id="memLevel" name="memLevel"><option value="관리자">관리자</option><option value="회원">회원</option></select></td>
                		</tr>
                		<tr>
                			<td>연락처</td>
                			<td><input type="text" class="form-control" id="memPhone" name="memPhone" /></td>
                		</tr>
                		<tr>
                			<td>이메일</td>
                			<td><input type="email" class="form-control" id="memEmail" name="memEmail" /></td>
                		</tr>
                	</table>
            	</div>
            	<div class="modal-footer">
            		<button type="submit" class="btn btn-primary" id="confirm">확인</button>
                	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            	</div>
            </form>
        </div>
    </div>
</div>
	</div>
</section>


<br><br>
<!-- footer -->
<%@ include file="footer.jsp" %>



<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	$(".btn-info").click(function(){ //수정
		$("#exampleModal").modal("show");
		var btn = $(this);
		var tr = btn.parent().parent();
		var td = tr.children();
		
		var id = td.eq(0).text();
		var name = td.eq(1).text();
		var level = td.eq(2).text();
		var phone = td.eq(3).text();
		var email = td.eq(5).text();
		
		$("#memberId").val(id);
		$("#memName").val(name);
		$("#memLevel").val(level).attr("selected","selected");
		$("#memPhone").val(phone);
		$("#memEmail").val(email);
	});
	
	$("#search").keyup(function(){ //회원 검색
		var k = $(this).val();
		$("#tbody > tr").hide();
		var temp = $(".table > #tbody > tr > td:nth-child(7n+1):contains('" + k + "')");
		
		$(temp).parent().show();
	});
});
</script>
</body>
</html>