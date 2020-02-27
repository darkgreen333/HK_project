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

<title>상품 등록</title>
<style>
.thumb_img img{
	margin:20px 0;
}
.explain_img img{
	margin:20px 0;
}

</style>
</head>
<body>
<div class="container">


	<h3>상품 등록</h3>
	
	<form role ="form" method="post" autocomplete="off" action="register" enctype="multipart/form-data">
	
		<br> <br>
		
		
		<BR><BR>
		상품 분류 번호 : 1.BED  2.TABLE  3.CHAIR  4.SOFA 5.BOOKSHLF 6.ETC <bR><bR>
		상품 분류 : <input type="number"  min=1 max=6  style="width:25%"  id="items_cate" name="items_cate"><br> <br>
		
		
		상품 이름 : <input type="text"style="width:25%"  id="items_name" name="items_name"><br> <br>
		상품 수량 : <input type="number" style="width:25%" id="items_quant" name="items_quant"><br> <br>
		상품 배송료:<input type="number" style="width:25%"  id="items_deli" name="items_deli"/>원 <br> <br>
		상품 가격 : <input type="number" style="width:25%"  id="items_price" name="items_price">원<br> <br>
		썸네일 사진 : <input type="file" style="width:25%"  id="items_image" name="items_image"><br> <br>
		<div class="thumb_img"><img src=""></div>
		
		
		상품 재고 : <input type="number" style="width:25%"  id="" name="items_stock"><br> <br>
		상품 설명 : <textarea cols=20 rows="10" id="items_explain" name="items_explain" style="width:25%"></textarea> 
		<input type="hidden" id="items_date" name="items_date"><br>
		상세 사진: <input type="file" style="width:25%"  id="items_ex_image" name="items_ex_image">
		<div class="explain_img"><img src=""></div><br><Br>
		
		<br>
		
		<input type="submit" value="등록">
		<br><BR><br><BR><br><BR><br><BR>
		  
		
		
	
	</form>

</div>


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
					
					$(".thumb_img img").attr("src",data.target.result).width(500);
				}
				reader.readAsDataURL(this.files[0]);
			}
		})
		$("#items_ex_image").change(function(){ //상세설명 이미지 미리보기
			if(this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data) {
					$(".explain_img img").attr("src",data.target.result).width(500);
				}
				reader.readAsDataURL(this.files[0]);
			}
		})
	});
</script>


</body>
</html>