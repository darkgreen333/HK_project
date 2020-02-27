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
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/viewerjs/1.3.7/viewer.min.css" />

<title>상품 상세 페이지</title>
<style>
.thumb {
   width:100%;
   height:574px;
   cursor:zoom-in;
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
#plus, #minus{
   
   border:none;
   background:none;
}

#sum {
    width: 60px;
}
.btn.btn-sea{background-color: #08bc9a; border-color: #08bc9a; -webkit-box-shadow: 0 3px 0 #088d74; box-shadow: 0 3px 0 #088d74;}
.btn.btn-sea:hover{background-color:#01a183;}
.btn i {padding-right:0.8em; line-height:22px;}
.icon-only{padding: 1em;}
.icon-only i{padding-right:0; font-size:22px; line-height:22px; }
.btn.btn-concrete{background-color: #7e8c8d; border-color: #7e8c8d; -webkit-box-shadow: 0 3px 0 #4e5b5c; box-shadow: 0 3px 0 #4e5b5c;}
.btn.btn-concrete:hover{background-color:#6a7879;}
.btn.btn-concrete:active{top: 3px; outline: none; -webkit-box-shadow: none; box-shadow: none;}

</style>
</head>
<body>



<!-- header -->
<%@ include file="header.jsp" %>

<section>
   <div id="main">

<div class="container">
   <br><br><br><BR>
   <form action="order_view" role ="form" method="post" autocomplete="off" name="form" style="font-size:13px" id="orderForm">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      <input type="hidden" id="items_code" name="code" value="${user_view.items_code}" />
      <input type="hidden" name="pimage" value="${user_view.items_image}" />
      <input type="hidden" name="explain" value="${user_view.items_explain}" />
      <input type="hidden" name="deli" value="${user_view.items_deli}" />
      <input type="hidden" name="stock" value="${user_view.items_stock}" />
      <input type="hidden" name="pname" value="${user_view.items_name}" />
      
      <div class="row">
         <div class="col-7">
            <img src="upload/${user_view.items_image}" class="thumb" alt="${user_view.items_name}"/ >
         </div><!-- col-7 -->
         
         <div class="col-5">
            <span><b>${user_view.items_name}</b></span>
            <hr><br>
            <span>${user_view.items_explain}</span><br>
            <hr><br>
            
            구입 수량: 
            <input type=hidden name="sell_price" value="${user_view.items_price}">
            <button type="button" class="btn btn-outline-dark" id="plus">+</button>
            <input type="number" class="text-center" name="amount" value="1" id="numBox" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')" min="1" max="${user_view.items_stock}">
            <button type="button" class="btn btn-outline-dark" id="minus">-</button>
            <span>(재고 : ${user_view.items_stock})</span><br>
            
            <hr><br> 
            상품 배송료: <span>&nbsp;<fmt:formatNumber value="${user_view.items_deli}" pattern="###,###,###"/></span>&nbsp;원
            <hr><br>
            상품 가격 :<span>&nbsp;<fmt:formatNumber value="${user_view.items_price}" pattern="###,###,###"/></span>&nbsp;원
            <hr><BR>
            
            총 금액 : <input type="number" name="sum" id="sum" style="border:none;" readonly>원
         
            
            <hr><br>
             &nbsp;&nbsp;&nbsp;
             
            <div id="buy" style="display:inline; width:120px">         
               <a class="btn btn-concrete" style="color:white;  width:120px">Buy Now</a>         
            </div>
            
            <div style="display:inline">
               <a class="btn btn-sea" id="cartBtn" style="color:white"><i class="fa fa-shopping-cart"></i> Add to cart</a>                  
            </div>
            
         </div><!-- col-5 -->
      </div><!-- class="row" -->
         <br><br>
         <hr><hr>
         <br><br>
         
         <br><br>
         <img src="upload/${user_view.items_image}" class="bigImage"/>
         <img src="upload/${user_view.items_ex_image}" class="exImage"/><br><br>
         
      
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
         
         
      <br><BR><br><BR><br><BR>
</form>
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
<!--angular js -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/viewerjs/1.3.7/viewer.min.js"></script>
<script>
$(document).ready(function(){
   var num = $("#numBox").val();
   $("#sum").val(${user_view.items_price} * num);
    //수량 조절
    //최대량은 재고보다 클 수 없고, 최소량은 1임
    $("#plus").click(function(){
       var num = $("#numBox").val();
       var plusNum = Number(num) + 1;
       
       if(plusNum >= ${user_view.items_stock}){
          $("#numBox").val(num);
          return;
       } 
       else {
         $("#numBox").val(plusNum);
       }
       $("#sum").val(${user_view.items_price} * plusNum);
    });
    
    $("#minus").click(function(){
       var num = $("#numBox").val();
       var minusNum = Number(num) - 1;
       
       if(minusNum <= 0) {
          $("#numBox").val(num);
          return;
       }
       else {
          $("#numBox").val(minusNum);
       }
       $("#sum").val(${user_view.items_price} * minusNum);
    });
    
    
    $("#numBox").on("propertychange change keyup paste blur", function(){
         var num = $("#numBox").val();
         if(num > ${user_view.items_stock}){
            swal("재고량보다 많습니다.");
            this.value = 1;
         }else if(num == 0 || num == ''){
            swal("최소구매수량을 입력해주세요.");
            this.value = 1;
         }else{
            $("#sum").val(${user_view.items_price} * num);
         }
      });
      
    $("#buy").click(function(event){
           event.preventDefault;
           "<sec:authorize access='isAnonymous()'>"
                confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
              "</sec:authorize>"
                $("#orderForm").submit();
           });
       
    
    
    /*
    //1000단위 콤마
    function addComma(num) {
       var regexp = /\B(?=(\d{3})+(?!\d))/g;
       return num.toString().replace(regexp, ',');
   }*/
   /*
    function add() {
       var total =  Number($("#deli").val()) + (Number($("#price").val()) * Number($("#numBox").val())); 
         console.log(total);
         $("#total").val(Number(total));

    }*/
    
   
   

    /*
    //총금액 (수량이 기본적으로 1로 되어있을때)
    if($("#numBox").val() == 1 ){
       var total =  Number($("#deli").val()) + (Number($("#price").val()) * Number($("#numBox").val())); 
         console.log(total);
         $("#total").val(Number(total));
      
      console.log($("#total").val());
      console.log(parseInt($("#deli").val()));
      console.log(parseInt($("#price").val()));
    }else {
       
    }*/
    

    
    //장바구니
    $("#cartBtn").click(function(){
   
      var cartKey;
      var value ={};
      var obj = [];
      //변수 생성(변수1개와 배열변수 2개 생성)
      
      value = { //value값 넣어주기(객체형으로)
            code :'${user_view.items_code}',
            image : '${user_view.items_image}',
            name : '${user_view.items_name}',
            quant : $("#numBox").val(),
            deli : '${user_view.items_deli}',
            price : '${user_view.items_price}',
            sum : $("#sum").val()
         }
      
      
      if(localStorage.getItem("cartKey") == null) {//로컬스토리지에 처음넣을때
         //getItem localStorage에 있는지 확인(없을경우 true을 반환)
         //alert("xxx");
         obj[0] =value;//배열 index 0번에 값 넣어주기(배열의 첫값)
         var y = JSON.stringify(obj);//변수 y에 json형태로 변경하기 //배열 obj를
         //alert(obj.length);
         localStorage.setItem("cartKey",y);  //키값과 json형태로 변경한 변수를 넣어서 localStorage에 넣어주기

      
      }
      
      else{
         //변수 z생성후 localStorage안에 있는 vlaue값을 불러옴
         var z= localStorage.getItem("cartKey"); //json string
         
           //변수 배열에 JSON.parse() 메서드를 주어 객체를 생성
           //JSON.parse() 메서드는 JSON 문자열의 구문을 분석하고, 그 결과에서 JavaScript 값이나 객체를 생성합니다
         obj = JSON.parse(z); //array
         leng = obj.length; //배열의 개수를 leng변수에 넣기
         //alert(leng);//배열의 원소개수
         obj[leng] = value; //  obj배열 끝 부분에 value값을 넣기
         var a = JSON.stringify(obj); //  변수 a에 json형식으로 배열값을 변경해서 저장
         localStorage.setItem("cartKey",a);   //key값을 주고 json형식으로 변환한 배열을 저장한 변수를 value값으로 지정

         
      }
      
      //cart로 이동
      location.href ="cart";

    });
    
 
    var viewer = new Viewer(document.querySelector('.thumb'), {
       navbar : false,
       toolbar : false
    });

 });
</script>




</body>
</html>