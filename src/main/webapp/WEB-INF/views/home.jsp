<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>SUPLLEX</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link href="https://fonts.googleapis.com/css?family=Acme|Zilla+Slab&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link type = "text/css" rel = "stylesheet" href = "resources/css/main.css"/>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Acme|Ropa+Sans|Ubuntu|Zilla+Slab&display=swap" rel="stylesheet">
<style>
.carousel-inner >.carousel-item > .view > video {
	width:100%;
	height:570px;
}
.carousel-indicators {
	
}
#top-button {
	position:fixed;
	right:2%;
	bottom:50px;
	display:none;
	z-index:999;
}
.rounded-circle {
	transform: scale(1);
	transition: all 0.4s ease-in-out;
}
.rounded-circle:hover {
	transform: scale(1.2);
}
.rolling_panel { position: relative; width: 100%; height: 220px; margin: 0; padding: 0;  overflow: hidden; }
.rolling_panel ul { position: absolute; margin: 15px; padding: 0; list-style: none; }
.rolling_panel ul li { float: left; width: 220px; height: 220px; margin:3px;}

.new_arrival {
	display: flex;
	flex-basis: 100%;
	align-items: center;
	color: #606060;
	font-size: 25px;
	margin: 8px 0px;
	
}
.new_arrival::before,
.new_arrival::after {
	content: "";
	flex-grow: 1;
	background:#606060 ;
	height: 1px;
	font-size: 0px;
	line-height: 0px;
	margin: 0px 16px;
}

.best_category {
	display: flex;
	flex-basis: 100%;
	align-items: center;
	color: #606060;
	font-size: 25px;
	margin: 8px 0px;
}
.best_category::before,
.best_category::after {
	content: "";
	flex-grow: 1;
	background:#606060;
	height: 1px;
	font-size: 0px;
	line-height: 0px;
	margin: 0px 16px;
}
</style>
</head>
<body>

<!-- header -->
<%@ include file="header.jsp" %>
 
<!-- ----------------------------메인------------------------------------------- -->
<div id="main" class="wrap">	

<!-- carousel -->
 	<section class="section-gap">
       <div class="container-fluid">
          <div id="myCarousel" class="carousel slide" data-ride="carousel">
             <!-- Indicators -->
             <ul class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1" ></li>
                <li data-target="#myCarousel" data-slide-to="2" ></li>
                <li data-target="#myCarousel" data-slide-to="3" ></li>
              
             </ul>
             
             <!-- slideshow -->
             <div class="carousel-inner">
             
             	   <div class="carousel-item  active">
                  <img src="img/b2.jpg" alt ="banner4" style="width:100%; height:680px;"  />
                  <div class="carousel-caption">	
						<h4>Hide Away in Your Querencia</h4>
						<p>SUPLLEX</p>
					</div>
                </div>
              
              	    <div class="carousel-item">
                   <img src="img/banner1.jpg" alt="banner1" style="width:100%; height:680px;"   />
                   
                   <div class="carousel-caption">	
						<h4>Hide Away in Your Querencia</h4>
						<p>SUPLLEX</p>
					</div>
                </div>
                
        
                   <div class="carousel-item">
                  <img src="img/b3.jpg" alt ="banner4" style="width:100%; height:680px;"  />
                  <div class="carousel-caption">	
						<h4>Hide Away in Your Querencia</h4>
						<p>SUPLLEX</p>
					</div>
                </div>
          

                
                <div class="carousel-item">
                  <img src="img/banner4.jpg" alt ="banner4" style="width:100%; height:680px;" />
                  <div class="carousel-caption">	
						<h4>Hide Away in Your Querencia</h4>
						<p>SUPLLEX</p>
					</div>
                </div>
              
             </div>
             
             <!-- Left and right controls -->
			 <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
			    <span class="carousel-control-prev-icon"></span>
			  </a>
			  <a class="carousel-control-next" href="#myCarousel" data-slide="next">
			    <span class="carousel-control-next-icon"></span>
			  </a>
          </div>
       </div>
 </section>


<Br><br><Br>
 <!-- category -->
<section>
	<div class="container">
		<h2 class="text-center mt-5 mb-5 best_category" style="font-family:arial">CATEGORY</h2>
		<div class="rolling_panel d-flex">
			<ul>
				<li id="chair"><a href="userList?chair"><img src="img/chair4.jpg" class="rounded-circle" alt="의자" width="180" height="180" /></a></li>
				<li id="table"><a href="userList?table"><img src="img/st.jpg" class="rounded-circle "  width="180" height="180" /></a></li>
				<li id="sofa"><a href="userList?sofa"><img src="img/sofa9.jpg" class="rounded-circle"  width="180" height="180" /></a></li>
				<li id="bed"><a href="userList?bed"><img src="img/bed1.jpg" class="rounded-circle"  width="180" height="180" /></a></li>
				<li id="bookshelf"><a href="userList?bookshelf"><img src="img/bookshelf1.jpg" class="rounded-circle"  width="180" height="180" /></a></li>
				<li id="etc"><a href="userList?etc"><img src="img/etc3.jpeg" class="rounded-circle"  width="180" height="180" /></a></li>
			</ul>
		</div>
	</div>
</section><br/><br/><br/><br/><br/>

<section>
	<div>
		<div class="container">
		<h2 class="text-center mt-5 mb-5 new_arrival" style="font-family:arial">BEST ITEM</h2>
		
			
			<div class="row text-center mt-3 mb-5">
				<a href="user_view?n=2008"><img src="img/table2.png" class="rounded m-5" alt="소파" width="210" height="210">
					<h5>[Stooli] WoodLine Stool</h5>
					<p>97,800원</p></a>
				<a href="user_view?n=3010"><img src="img/armchair1.png" class="rounded m-5" alt="armchair" width="210" height="210">
					<h5>[ARMO] redia arm chair</h5>
					<p>364,000원</p></a>
				
				<a href="user_view?n=3009"><img src="img/armchair3.png" class="rounded m-5" alt="armchair" width="210" height="210">
					<h5>[ARMO] Luno arm chair</h5>
					<p>228,000원</p></a>
				<a href="user_view?n=3012"><img src="img/armchair7.png" class="rounded m-5" alt="armchair" width="210" height="210">
					<h5>[ARMO] Ivori c arm chair</h5>
					<p>516,000원</p></a>
				<a href="user_view?n=3014"><img src="img/armchair5.png" class="rounded m-5" alt="armchair" width="210" height="210">
					<h5>[ARMO] mint arm chair</h5>
					<p>436,000원</p></a>
				<a href="user_view?n=3013"><img src="img/armchair6.png" class="rounded m-5" alt="armchair" width="210" height="210">
					<h5>[ARMO] lulu arm chair</h5>
					<p>712,000원</p></a>	
			
				<a href="user_view?n=3017"><img src="img/armchair9.png" class="rounded m-5" alt="armchair" width="210" height="210">
					<h5>[ARMO] regu arm chair</h5>
					<p>635,000원</p></a>
					
					
				<a href="user_view?n=4010"><img src="img/sofa20.png" class="rounded m-5" alt="소파"width="210" height="210">
					<h5>[UOT] lamia sofa</h5>
					<p>6,489,000원</p></a>
					
				<a href="user_view?n=4011"><img src="img/sofa27.png" class="rounded m-5" alt="소파" width="210" height="210">
					<h5>[UOT] wedge sofa</h5>
					<p>7,568,000원</p></a>
		
				<a href="user_view?n=4008"><img src="img/sofa26.png" class="rounded m-5" alt="소파" width="210" height="210">
					<h5>[PSTS] rackada sofa</h5>
					<p>8,790,000원</p></a>
					
				<a href="user_view?n=4009"><img src="img/sofa29.png" class="rounded m-5" alt="소파" width="210" height="210">
					<h5>[UOT] vio sofa</h5>
					<p>6,325,000원</p></a>
					
				<a href="user_view?n=4007"><img src="img/sofa23.png" class="rounded m-5" alt="소파" width="210" height="210">
					<h5>[WEVO] pino sofa</h5>
					<p>3,250,000원</p></a>
				
				</div>	
			</div>
			</div>
			

</section>

<button class="btn btn-lg" id="top-button" style="background-color:antiquewhite; font-family:arial; font-size:18px"><i class="ri-arrow-up-fill"></i><br/>TOP</button>
 

</div>
 <br><br><br>
<!-- ========================= footer ========================= -->
<div>
<jsp:include page="footer.jsp" flush="false" />
</div>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
$(document).ready(function(){
	var topBar = $("#navbar").offset();
	
	$(window).scroll(function(){
		if($(document).scrollTop()>=topBar.top)
		{	
			$("#navbar").css({
				position:"fixed",
				top:"0",
				width:"100%",
				margin:"0 auto"
			});
		}
		else
		{
			$("#navbar").css({
				position:"relative",
				top:""
			});
		}
	});
	$(window).scroll(function(){ //top버튼
		if($(this).scrollTop() > 500) {
			$("#top-button").fadeIn();
		}else {
			$("#top-button").fadeOut();
		}
	});
	$("#top-button").click(function(){
		$("html, body").animate({
			scrollTop:0
		}, 400);
		return false;
	});
	
	var $panel = $(".rolling_panel").find("ul");
	 
    var itemWidth = $panel.children().outerWidth(); // 아이템 가로 길이
    var itemLength = $panel.children().length;      // 아이템 수

    // Auto 롤링 아이디
    var rollingId;

    auto();

    // 배너 마우스 오버 이벤트
    $panel.mouseover(function() {
        clearInterval(rollingId);
    });

    // 배너 마우스 아웃 이벤트
    $panel.mouseout(function() {
        auto();
    });

    // 이전 이벤트
    $("#prev").on("click", prev);

    $("#prev").mouseover(function(e) {
        clearInterval(rollingId);
    });

    $("#prev").mouseout(auto);

    // 다음 이벤트
    $("#next").on("click", next);

    $("#next").mouseover(function(e) {
        clearInterval(rollingId);
    });

    $("#next").mouseout(auto);

    function auto() {

        // 2초마다 start 호출
        rollingId = setInterval(function() {
            start();
        }, 2000);
    }

    function start() {
        $panel.css("width", itemWidth * itemLength);
        $panel.animate({"left": - itemWidth + "px"}, function() {

            // 첫번째 아이템을 마지막에 추가하기
            $(this).append("<li>" + $(this).find("li:first").html() + "</li>");

            // 첫번째 아이템을 삭제하기
            $(this).find("li:first").remove();

            // 좌측 패널 수치 초기화
            $(this).css("left", 0);
        });
    }

    // 이전 이벤트 실행
    function prev(e) {
        $panel.css("left", - itemWidth);
        $panel.prepend("<li>" + $panel.find("li:last").html() + "</li>");
        $panel.animate({"left": "0px"}, function() {
            $(this).find("li:last").remove();
        });
    }

    // 다음 이벤트 실행
    function next(e) {
        $panel.animate({"left": - itemWidth + "px"}, function() {
            $(this).append("<li>" + $(this).find("li:first").html() + "</li>");
            $(this).find("li:first").remove();
            $(this).css("left", 0);
        });
    }
   /* 
	$("#items").click(function(event){
		event.preventDefault();
		$("#main").load("admin_page");
	});*/
	

	$("#bed").click(function(){
		event.preventDefault();
		$("#main").load("userList?bed");
	});
	$("#table").click(function(event){
		event.preventDefault();
		$("#main").load("userList?table");
	});
	$("#chair").click(function(event){
		event.preventDefault();
		$("#main").load("userList?chair");
	});
	$("#sofa").click(function(event){
		event.preventDefault();
		$("#main").load("userList?sofa");
	});
	$("#bookshelf").click(function(event){
		event.preventDefault();
		$("#main").load("userList?bookshelf");
	});
	$("#etc").click(function(event){
		event.preventDefault();
		$("#main").load("userList?etc");
	});
	
	

    
});


</script>
</body>
</html>