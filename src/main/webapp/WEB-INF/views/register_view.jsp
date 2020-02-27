<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "x" uri = "http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
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
<title>상품 등록</title>
<style>

#thumb_img img{
	margin:20px 0;
	
	
}
#explain_img img{
	margin:20px 0;
	
}

#category {
	color : #606060;
/*	text-align:center;*/
}
*{
/*	font-family: 'Nanum Myeongjo', serif;*/
	color : #606060;
	
}

#form{
	background-color: #f5f5f5
}
</style>
</head>
<body>


<!-- header -->
<%@ include file="header.jsp" %>


<section>
<div class="container" id="main">

<br>
	
	<h3 id="category"><b>상품 등록</b></h3>
	<hr>
	<form role ="form" method="post" autocomplete="off" action="register" enctype="multipart/form-data" id="form">
	
		<BR><BR>
		
		<div class="row">
			<div class="col-sm-4">
				<div id="thumb_img"><img src=""></div>
				썸네일 사진 : <input type="file" id="items_image" name="items_image">
			</div><!-- col-5 -->
			
			<div class="col-sm-2">
				<Br>
			</div>
			
			<div class="col-sm-6">
			
				상품 분류 : 
					<label><input type="radio" name="items_cate" value=1 checked="checked" />BED</label>
					<label><input type="radio" name="items_cate" value=2  />TABLE</label>
					<label><input type="radio" name="items_cate" value=3  />CHAIR</label>
					<label><input type="radio" name="items_cate" value=4  />SOFA</label>
					<label><input type="radio" name="items_cate" value=5  />BOOKSHELF</label>
					<label><input type="radio" name="items_cate" value=6  />ETC</label> <bR><br>
					<!-- 
				상품 분류   :  <input type="number"  min=1 max=6    id="items_cate" name="items_cate"><br> <br> -->
				상품 이름   :  <input type="text"  id="items_name" name="items_name"><br> <br>
				상품 수량   :  <input type="number" id="items_quant" name="items_quant"><br> <br>
				상품 재고   :  <input type="number"  id="items_stock" name="items_stock"><br> <br>
				상품 배송료: <input type="number"  id="items_deli" name="items_deli"/>원 <br> <br>
				상품 가격   :  <input type="number"  id="items_price" name="items_price">원<br> <br>
				
			</div><!-- col-7 -->
		
		</div><!-- row -->
		
		<br><br>
		
		<div class="row">
			<div class="col-sm-4">
				<div id="explain_img"><img src=""></div><br><Br>
					상세 사진: <input type="file"  id="items_ex_image" name="items_ex_image">
			</div>
			
			<div class="col-sm-2">
				<Br>
			</div>
			
			
			<div  class="col-sm-6">
				상품 설명   <br><br>
				<textarea cols="50" rows="17" id="items_explain" name="items_explain" ></textarea> 
				<input type="hidden" id="items_date" name="items_date"><br>
			</div>
		</div>
		<br><br><BR><br><BR>
		
		<div align="center">
		<input type="submit"  value="등록">
		</div>
		<br><BR><br><BR><br><BR>
	
	</form>

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
<!-- angularjs -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script>
	$(document).ready(function(){ //썸네일 사진 미리보기.
		$("#items_image").change(function(){
			if(this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data) {
					
					$("#thumb_img img").attr("src",data.target.result).width(500);
				}
				reader.readAsDataURL(this.files[0]);
			}
		})
		$("#items_ex_image").change(function(){ //상세설명 이미지 미리보기
			if(this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data) {
					$("#explain_img img").attr("src",data.target.result).width(500);
				}
				reader.readAsDataURL(this.files[0]);
			}
		})
	});
</script>


</body>
</html>