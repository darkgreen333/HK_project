<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "x" uri = "http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content = "IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<title>상품 조회</title>
<style>
.thumb {
	width:100%;
	height:100%;
}
.bigImage{
	width:100%;
	height:auto;
}
.exImage{
	width:100%;
	height:auto;
}

*{
	/*font-family: 'Nanum Myeongjo', serif;*/
}

</style>
</head>
<body>


<!-- header -->
<%@ include file="header.jsp" %>

<div id="main">



<div class="container">
	<br>

	<br>
	<br>
	<form role ="form" method="post" autocomplete="off" >
		<input type="hidden" id="items_code" name="n" value="${register_retrieve.items_code}" >
		
		<div class="row">
			<div class="col-7">
				<img src="upload/${register_retrieve.items_image}" class="thumb"/>
			</div><!-- col-7 -->
			
			<div class="col-5">
				<span><b>${register_retrieve.items_name}</b></span>
				<hr><br>
				<span>${register_retrieve.items_explain}</span></textarea>
				<hr><br>
				카테고리: <span>${register_retrieve.items_cate}</span>
				<hr><br>
				상품 수량 : <span>${register_retrieve.items_quant}</span>&nbsp;개
				<hr><br>
				상품 재고 : <span>${register_retrieve.items_stock}</span>&nbsp;개
				<hr><br>
				상품 배송료: <span><fmt:formatNumber value="${register_retrieve.items_deli}" pattern="###,###,###"/></span>&nbsp;원
				<hr><br>
				상품 가격 : <span><fmt:formatNumber value="${register_retrieve.items_price}" pattern="###,###,###"/></span>&nbsp;원
				<hr><br>
				<button type="submit">BUY NOW</button> &nbsp;&nbsp;&nbsp;
				<button type="submit">ADD TO CART</button>
				
			</div><!-- col-5 -->
		</div><!-- class="row" -->
			<br><br>
			<div align="right">
				 <button type="button" id="modify_btn" class="btn btn-warning">수정</button>
				 <button type="button" id="delete_btn" class="btn btn-danger delete_btn">삭제</button>
			</div>
			<hr><hr>
			<br><br>
			<div>
			
			</div>
			상세사진 <br><br>
			<img src="upload/${register_retrieve.items_image}" class="bigImage"/>
			<img src="upload/${register_retrieve.items_ex_image}" class="exImage"/><br><br>
			
			<div>
				<p><b><h3>[안내 말씀]</h3></b></p>
				<p><u><b>A/S 일반 규정</b></u></p>
				<br>
				<br>
				<p>제품 하자에 관련된 A/S는 1년간 무상 제공합니다.</p>
				<p>배송일 기준으로 1년 이후부터 제품의 상태에 따라 A/S비용이 발생합니다.(배송,출장비 포함)</p>
				<p>단,전시 상품 및 고객의 과실로 인한 A/S는 1년 이내에도 유상 처리 됩니다.</p>
				<br>
				<br>
				<p><u><b>A/S가 불가능한 경우</b></u></p>
				<br>
				<p>원목 특성인 직사광선, 난방기구, 가습기등에 의한 변형 또는 변색.</p>
				<p>원목과 대리석의 특성인 톤의 차이, 결의 패턴, 옹이, 실금 및 마감차이.</p>
				<p>천연 대리석의 자연스러운 흡수성으로 인해 발생하는 표면의 얼룩과 광택의 옅어짐.</p>
				<p>철제 제품을 습기가 많은 곳에 두어 발생되는 녹슴 현상.</p>
				<p>부속품 및 패브릭, 내장재 등 소모품.</p>
				<p>배송 후의 이동, 이사 또는 타인에게 양도 후 생긴 파손 및 고장.</p>
				<p>부적절한 취급 또는 부주의에 의해 생긴 파손 및 고장.</p>
				<p>제품의 사용 목적 이외의 사용이나 개조 등에 의한 파손 또는 사고.</p>
				<br>
				<br>
				<p><u><b>교환 및 환불 규정</b></u></p>
				<br>
				<p>전시 상품, 개별 주문 제작 상품의 경우 주문 취소 및 환불이 불가함.</p>
				<p>배송 전 계약 취소시 구매 금액의 10% 위약금 부과.</p>
				<p><p>잔금은 배송 2일 전까지 완납되어야 상품 출고 가능.(단, 전시상품 및 주문제막 상품은 계약시 완납)</p>
				<p>배송 후 교환 또는 반품하실 경우 왕복 배송비 + 위약금 20%부과.</p>
				<br>
				<br>
				<p><u><b>교환 및 환불이 불가한 경우</b></u></p>
				<br>
				<p>대리석과 원목의 자연스러운 특성과 가공시에 생기는 톤의 차이, 결 패턴, 옹이, 마감 및 실금의 차이가 있는 경우.</p>
				<p>천연가죽 특성의 불규칙한 가죽패턴, 가축의 성장과정에서 발생하는 가죽의 상처나 자국이 있는 경우.</p>
				<p>사용감에 따른 천연가죽의 자연스러운 주름이나 늘어남 현상 및 패브릭의 색 빠짐 현상(변색)의 경우.</p>
				<p>배송 완료 후의 나무,가죽, 패브릭, 오리털 특유의 냄새로 인한 경우.</p>
				<p>고객의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우.</p>
				<p>고객의 사용 또는 일부 소비에 이하여 상품의 가치가 현저히 감소한 경우.</p>
				<p>패브릭 직조에 따라 약간의 색상 차이가 느껴지는 경우.</p>
				<br><br>
			</div><!-- 안내사항 -->
			
			
		<br><BR>
		
		
			<br><BR>	<br><BR>
		<!-- 
		<a href="register_modify?n=${register_retrieve.items_code}">수정하기</a>
		<a href="register_delete?n=${register_retrieve.items_code}">r삭제하기</a>  -->
		
		
		
	</form>
</div>

</div>



<!-- footer -->
<%@ include file="footer.jsp" %>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- angularjs -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>


<script>
$(document).ready(function(){
	/*
	$("#modify_btn").click(function(){
		location.href ="register_modify?n=${register_retrieve.items_code}";
	});*/
	
	$("#modify_btn").click(function(event){
		event.preventDefault();
		$("#main").load("register_modify?n=${register_retrieve.items_code}");
	});
	
	$(".delete_btn").click(function(){
		confirm("삭제하시겠습니까?");
		location.href ="register_delete?n=${register_retrieve.items_code}";
			
	});

});
</script>



</body>
</html>