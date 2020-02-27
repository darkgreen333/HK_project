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
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<style>
h3{
	padding: 10px 0 25px;
	position: relative;
    /*margin-top: 60px;*/
   	font-size: 28px;
    font-weight: 400;
    color: #222;
}

h3::after{
	position: absolute;
    top: 0;
    left: 0;
    display: inline-block;
    width: 107px;
    height: 3px;
    background: #012b5d;
    content: ' ';
}


dl {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.bullet li:after, .bullet dt:after {
    content: ' ';
    display: block;
    width: 2px;
    height: 2px;
    position: absolute;
    top: 50%;
    left: 0;
    background: #888;
}

.bullet dt, .bullet dd {
    height: 30px;
    line-height: 30px;
}


.bullet li:after, .bullet dt:after {
    content: ' ';
    display: block;
    width: 2px;
    height: 2px;
    position: absolute;
    top: 50%;
    left: 0;
    background: #888;
}

dl.bullet:after {
    content: '';
    display: block;
    clear: both;
}

</style>
</head>


<script
 src="https://maps.googleapis.com/maps/api/js?key=
AIzaSyD5as-sSccQwSeWqnQrfjSLwEP98kr6_S0&sensor=false&language=kr"> //구글key값
</script> 

<script>
function initialize() { 
var myLatlng = new google.maps.LatLng(37.525919, 126.888959); // supllex 서울의 좌표값
var myLatlng2 = new google.maps.LatLng(33.251858, 126.556118); // supllex 제주의 좌표값
  
  //서울 지도
  var mapOptions = { 
        zoom: 16, // 지도 확대레벨 조정
        center: myLatlng, 
        mapTypeId: google.maps.MapTypeId.ROADMAP 
  } 

  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions); 
  var marker = new google.maps.Marker({ 
position: myLatlng, 
map: map, 
title: "SUPPLEX" // 마커에 마우스를 올렸을때 간략하게 표기될 설명글
}); 
  
  //제주도 지도
  var mapOptions2 = { 
	        zoom: 16, // 지도 확대레벨 조정
	        center: myLatlng2, 
	        mapTypeId: google.maps.MapTypeId.ROADMAP 
	  } 

	  var map2 = new google.maps.Map(document.getElementById('map_canvas2'), mapOptions2); 
	  var marker2 = new google.maps.Marker({ 
	position: myLatlng2, 
	map: map2, 
	title: "SUPPLEX_JEJU" // 마커에 마우스를 올렸을때 간략하게 표기될 설명글
	});  
  
  
  } 
window.onload = initialize;



</script>
 

<body>



<!-- header -->
<%@ include file="header.jsp" %>

	<Br>
	<section>
		<div id="main" class="container">
		
			<div class="row" >
				<div class="col-6" style="padding:45px;" >
					<h3>SUPLLEX 서울</h3>
					<dl class="bullet">
					   <dt>주소</dt><dd>서울 영등포구 양산로 53 월드메르디앙  101호</dd>
					   <dt>Tel</dt><dd>(02) 200-2323</dd>
					   <dt>Fax</dt><dd>(02) 200-4323</dd>
					</dl>
					<br>  
					<div id="seoul"> 
						<div id="map_canvas" style="width: 100%; height: 450px;">
						</div>
					</div><!-- 서울 회사 지도 -->
				</div>
				
				
				
					<div class="col-6" style="padding:45px;">
							<h3>SUPLLEX 제주</h3>
							<dl class="bullet">
					          <dt>주소</dt><dd>제주특별자치도 제주시 일도1동 1377-5</dd>
					          <dt>Tel</dt><dd>(064) 762-3200</dd>
					          <dt>Fax</dt><dd>(064) 792-5523</dd>
					        </dl>
					        <br>
					<div id="jeju"> 
						<div id="map_canvas2" style="width: 100%; height: 450px;">
						</div>
					</div><!-- 제주 회사 지도 -->							
		
			</div><!-- row -->
		
		</div>	
		</div><!-- main -->
</section>
<br><br><br><br><br><br>

<!-- footer -->
<%@ include file="footer.jsp" %>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>







</body>
</html>