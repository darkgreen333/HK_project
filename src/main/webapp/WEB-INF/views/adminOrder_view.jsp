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
<link href="https://fonts.googleapis.com/css?family=Jua|Sunflower:300&display=swap" rel="stylesheet">
<style>
.mainBox {
	overflow-x:auto;
	width:100%;
	height:100px;
	display:table;
}
.contentBox {
	display:table-cell;
	vertical-align:middle;
	font-size: 18px;
}
.table {
	font-family: 'Sunflower', sans-serif;
}
</style>
</head>
<body>

<%@ include file="header.jsp" %>
<section>
	<div id="main">
		<div class="page-wrapper">
		    <div class="container-fluid">
		        <div class="col-lg-12"><!--게시판 넓이 -->
		            <div class="col-lg-12">
		                <h1 style="font-size:50px"><strong>주문관리</strong></h1>
		            </div>
		           <div class="table-responsive mt-5">
		               <table class="table table-hover table-bordered text-center mt-5">
		                   <thead style="font-size:20px">
		                       <tr>
		                           <th>주문번호</th>
		                           <th>상품정보</th>
		                           <th>주문자아이디</th>
		                           <th>주문일자</th>
		                           <th>상품가격</th>
		                           <th>수량</th>
		                           <th>배달비</th>
		                           <th>결제금액</th>
		                           <th>결제수단</th>
		                           <th>주문상태</th>
		                       </tr>
		                   </thead>
		                   <tbody>
		                   	<c:forEach items="${list}" var="list">
		                       <tr>
		                           <td>
		                            	<div class="mainBox">
		                             	<div class="contentBox">
		                             		<span>${list.orderNum}</span>
		                         		</div>
		                           		</div>
		                           </td>
		                           <td>
		                           		<div class="mainBox">
		                           			<div class="contentBox">
		                          				<img src="${list.orderPimage }" style="width:50px; float:left; height:80px; margin-top:10px"><p style="line-height:80px; margin-top:10px">${list.orderPname }</p>
		                          			</div>
		                           		</div>
		                           </td>
		                           <td>
		                           		<div class="mainBox">
		                           			<div class="contentBox">
		                           				<span>${list.orderId }</span>
		                           			</div>
		                           		</div>
		                           </td>
		                           <td>
		                           		<div class="mainBox">
		                           			<div class="contentBox">
		                           				<span><fmt:formatDate pattern="YYYY-MM-dd HH:mm" value="${list.orderDate }"/></span>
		                           			</div>
		                           		</div>
		                           </td>
		                           <td>
		                           		<div class="mainBox">
		                           			<div class="contentBox">
		                           				<span>${list.orderPrice}</span>
		                           			</div>
		                           		</div>
		                           </td>
		                           <td>
		                           		<div class="mainBox">
		                           			<div class="contentBox">
		                           				<span>${list.orderQuant}</span>
		                           			</div>
		                           		</div>
		                           </td>
		                           <td>
		                           		<div class="mainBox">
		                           			<div class="contentBox">
		                           				<span>${list.orderDeli}</span>
		                           			</div>
		                           		</div>
		                           </td>
		                           <td>
		                           		<div class="mainBox">
		                           			<div class="contentBox">
		                           				<span>${list.orderAmount}</span>
		                           			</div>
		                           		</div>
		                           </td>
		                           <td>
		                           		<div class="mainBox">
		                           			<div class="contentBox">
		                           				<span><c:if test="${list.orderPm eq 'card'}">신용카드</c:if></span>
		                           			</div>
		                           		</div>
		                           </td>
		                           <td>
		                           		<div class="mainBox">
		                           			<div class="contentBox">
		                           				<select>
		                           					<option value="결제확인중" <c:if test="${list.orderState eq '결제확인중'}">selected</c:if>>결제확인중</option>
		                           					<option value="결제확인" <c:if test="${list.orderState eq '결제확인'}">selected</c:if>>결제확인</option>
		                           					<option value="상품준비중" <c:if test="${list.orderState eq '상품준비중'}">selected</c:if>>상품준비중</option>
		                           					<option value="상품발송" <c:if test="${list.orderState eq '상품발송'}">selected</c:if>>상품발송</option>
		                           					<option value="배달완료" <c:if test="${list.orderState eq '배달완료'}">selected</c:if>>배달완료</option>
		                           				</select>
		                           			</div>
		                           		</div>
		                           </td>
		                       </tr>
		                   	</c:forEach>
		                   </tbody>
		               </table>
		           </div>
		        </div>
		    </div>
		</div>
	</div>
</section>
<!-- footer -->
<%@ include file="footer.jsp" %>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>