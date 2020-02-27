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
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<%@ include file="header.jsp" %>

<section>
	<div id="main">
		<div class="page-wrapper">
		    <div class="container-fluid">
		        <div class="col-lg-12"><!--게시판 넓이 -->
		            <div class="col-lg-12">
		                <h1><strong>주문내역조회</strong></h1>
		            </div>
		            <div class="panel panel-default">
		                <div class="panel-body">
		                    <table class="table table-hover">
		                        <thead style="font-size:20px">
		                            <tr>
		                                <th>주문번호</th>
		                                <th>상품정보</th>
		                                <th>주문일자</th>
		                                <th>주문금액</th>
		                                <th>수량</th>
		                                <th>주문상태</th>
		                            </tr>
		                        </thead>
		                        <tbody>
			                       	<c:forEach items="${user}" var="user">
			                           <tr>
			                               <td>${user.orderNum }</td>
			                               <td><img src="${user.orderPimage}" style="width:50px;height:50px"><a>${user.orderPname }</a></td>
			                               <td><span><fmt:formatDate pattern="YYYY-MM-dd E" value="${user.orderDate}"/></span></td>
			                               <td><span>${user.orderAmount}</span></td>
			                               <td><span>${user.orderQuant}</span></td>
			                               <th><span>${user.orderState}</span></th>
			                           </tr>
			                       	</c:forEach>
		                        </tbody>
		                    </table>
		                </div>
		            </div>
		        </div>
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