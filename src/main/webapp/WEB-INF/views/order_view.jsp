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
<title>주문하기</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.thumb {
   width:25%;
   height:100%;
}
tbody tr td a {
   font-family:arial;
   font-weight:bold;
   font-size:18px;
   color:black;
   
}
a:hover {
   color:skyblue;
   text-decoration:none;
}
#productImg {
   display:inline;
   float:left;
}
pre {
   float:left;
}
tbody tr td {
   height:180px;
}
tbody tr td span {
   display:flex;
   justify-content: center; 
}
.mainBox {
   width:100%;
   height:100%;
   display:table;
}
.contentBox {
   display:table-cell;
   vertical-align:middle;
}
#orderInfo tr td{
   height:50px;
}
.box-radio-input input[type="radio"]{
    display:none;
}

.box-radio-input input[type="radio"] + span{
    display:inline-block;
    background:none;
    border:1px solid #dfdfdf;    
    padding:0px 10px;
    text-align:center;
    height:50px;
    width:120px;
    font-size:15px;
    line-height:45px;
    font-weight:500;
    cursor:pointer;
}

.box-radio-input input[type="radio"]:checked + span{
    border:1px solid #23a3a7;
    background:#23a3a7;
    color:#fff;
}

tr td p {
   font-size:15px;
}
#memAdd2, #memAdd3 {
   margin-left: 85px;
}
 
</style>
</head>
<body>

<%@ include file="header.jsp" %>

<section>
	<div id="main">

<div class="container mt-5">
   <div class="row">
      <div class="col-sm-12">
         <h1 style="font-family:arial">주문 상품</h1><hr>
         <table class="table table-bordered" style="table-layout:fixed">
            <thead>
               <tr class="text-center">
                  <th width="65%">
                     <span style="font-size:22px">상품정보</span>
                  </th>
                  <th>
                     <span style="font-size:22px">상품금액</span>
                  </th>
                  <th>
                     <span style="font-size:22px">수량</span>
                  </th>
                  <th>
                     <span style="font-size:22px">배송비</span>
                  </th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td>
                     <a href="#"><img id="productImg" src="upload/${image}" class="thumb"></a><a href="#" style="font-size:22px;text-decoration:none">${name}</a><br/><p>${explain}</p>
                  </td>
                  <td>
                     <div class="mainBox">
                        <div class="contentBox">
                           <span style="font-size:20px"><fmt:formatNumber value="${price}" pattern="###,###,###" />원</span>
                        </div>
                     </div>
                  </td>
                  <td align="center">
                     <div class="mainBox">
                        <div class="contentBox">
                           <input id="amount" type="number" value="${amount}" style="width:50px; height:35px; font-size:20px; text-align:center; background-color:#e2e2e2;" min="1" max="${stock}">
                        </div>
                     </div>
                  </td>
                  <td>
                     <div class="mainBox">
                        <div class="contentBox">
                           <span style="font-size:20px"><fmt:formatNumber value="${deli}" pattern="###,###,###" />원</span>
                        </div>
                     </div>
                  </td>
               </tr>
            </tbody>
               <tr>
                  <td colspan="4" align="center" style="background-color:#feffbf; width:100%">
                     <div class="mainBox">
                        <div class="contentBox" style="font-size:20px">상품금액 : <strong id="price"><fmt:formatNumber value="${price}" pattern="###,###,###" /></strong>원 + 배송비 : <strong><fmt:formatNumber value="${deli}" pattern="###,###,###" /></strong>원 = 총 주문금액 : <font color="red"><strong id="total2" ></strong></font>원</div>
                     </div>
                  </td>
               </tr>
         </table>
         <hr>
      </div>
   </div><br/><br/>
   
   <h1 style="display:inline; font-family:arial">결제 정보</h1>&nbsp;<font color="9c9e9e"><span style="font-size:15px;">(*는 필수입력사항입니다.)</span></font>
   <hr>
   <div class="row">
      <div class="col-6">
         <form action="">
            <table class="table table-bordered table-hover" id="orderInfo">
               <tr>
                  <td>
                     <p style="display:inline;" class="col-2">수령인</p>
                     <input class="ml-3 col-4 form-control" id="memName" style="display:inline; height:35px" type="text" placeholder="수령인*" required/>
                  </td>
               </tr>
               <tr>
                  <td>
                     <p style="display:inline" class="col-2">연락처</p>
                     <input class="ml-3 col-4 form-control" id="memPhone" style="display:inline; height:35px" type="text" placeholder="연락처* ex)010-1234-1234" required/>
                  </td>
               </tr>
               <tr>
                  <td>
                     <p style="display:inline" class="col-2">주&nbsp;&nbsp;소</p>
                     <div style="display:inline; text-indent:15%"><input class="ml-4 col-4 form-control" style="display:inline; height:35px" id="memAdd1" name="memAdd1" placeholder="우편번호*" readonly required>
                     <button onclick="DaumPostcode()" style="height:35px; font-size:12px">우편번호찾기</button><br/></div>
                     <div style="display:inline;"><input class="mt-2 col-8 form-control" style="display:inline; height:35px" id="memAdd2" name="memAdd2" readonly><br/></div>
                     <div style="display:inline;"><input class="mt-2 col-8 form-control" style="display:inline; height:35px" id="memAdd3" name="memAdd3" placeholder="주소*" required></div>
                  </td>
               </tr>
            </table>
         </form>
      </div>
      <div class="col-6">
         <form action="">
            <table class="table table-bordered table-hover">
               <tr>
                  <td>
                     <p style="display:inline">결제수단<p>
                     <div style="text-align:center; margin:0 auto">
                        <div style="display:inline-block">
                           <label class="box-radio-input"><input type="radio" name="cp_item" id="option1" value="옵션1" checked="checked"><span>신용카드</span></label>
                           <label class="box-radio-input"><input type="radio" name="cp_item" id="option2" value="옵션2"><span>무통장입금</span></label>
                        </div><br/><br/>
                        <div id="selectOption" style="display:none">
                           <select style="height:35px; display:inline; width:100%; font-size:15px; text-align-last:center; vertical-align:middle" class="form-control">
                              <option value="" selected>------------------------------------ 선택 ------------------------------------</option>
                              <option value="">신한 110-396-554689</option>
                           </select>
                           <input class="mt-5 form-control" style="display:inline; height:35px; width:100%; text-align:center" placeholder="입금자명*" >
                        </div>
                     </div><br/><br/>
                     <div class="text-center">
                        <button class="btn btn-danger" style="width:100%; height:50px; font-size:20px" id="pay">결제하기</button>
                     </div>
                  </td>
               </tr>
            </table>
         </form>
      </div>
   </div>
   <hr>
   	</div>
</div>
</section>
   <br/><br/>
   <%@ include file="footer.jsp" %>
<input type="hidden" id="code" value="${code}">
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- 다음api -->
<script src='https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js'></script> 
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script> <!-- iamport 결제모듈 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$(document).ready(function(){
   
   $("#price").text(($("#amount").val() * ${price}).toLocaleString());
   $("#total2").text(($("#amount").val() * ${price} + ${deli}).toLocaleString());
   
   $("#amount").on("propertychange change paste blur keyup", function(){
      var amount = $("#amount").val();
      var total = amount * ${price};
      var deli = ${deli};
      if(amount > ${stock}) {
         swal("재고량보다 많습니다.");
         this.value = 1;
      }
      else if(amount == 0 || amount == '') {
         swal("최소수량을 입력하세요.");
         this.value = 1;
      }
      $("#price").text(total.toLocaleString());
      $("#total2").text((total + deli).toLocaleString());
   });
   
   $("#option2").click(function(){
      $("#option2").prop("checked", true);
      $("#selectOption").show();
   });
   $("#option1").click(function(){
      $("#option1").prop("checked", true);
      $("#selectOption").hide();
   });
});

function DaumPostcode() {
   new daum.Postcode(
      {
            oncomplete : function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if (data.userSelectedType === 'R') {
                    //법정동명이 있을 경우 추가한다.
                    if (data.bname !== '') {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', '
                                + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' (' + extraAddr
                            + ')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('memAdd1').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('memAdd2').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('memAdd3').focus();
            }
        }).open();
};

$("#pay").click(function(e){
   e.preventDefault();
   
   var phoneNumber = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
   if($("#memName").val() == '') {
      swal("수령인을 입력하세요.").then((value) => {
         $("#memName").focus();
      });
      return false;
   } 
   else if($("#memPhone").val() == '') {
      swal("연락처를 입력하세요.").then((value) => {
         $("#memPhone").focus();
      });
      return false;
   }
   else if($("#memAdd1").val() == '') {
      swal("우편번호를 입력하세요.").then((value) => {
         $("#memAdd1").focus();
      });
      return false;
   }
   else if($("#memAdd3").val() == '') {
      swal("주소를 입력하세요.").then((value) => {
         $("#memAdd3").focus();
      });
      return false;
   }
   else if(!phoneNumber.test($("#memPhone").val())) {
      swal("연락처를 확인해주세요.").then((value) => {
         $("#memPhone").focus();
      });
      return false;
   }
   if($("#option2").is(":checked")) {
      location.href = "complete2_view";
   }
   
   var IMP = window.IMP; // 생략가능
   IMP.init('imp19337315');  // 가맹점 식별 코드
   
   var date = new Date();
   var total = $("#total2").text();
   var amount = parseInt(total.replace(/[^\d]+/g, ''));
   var result;
   
   IMP.request_pay({
      pg : 'html5_inicis', // 결제방식
       pay_method : 'card',   // 결제 수단
       merchant_uid : moment(date).format('YYMMDDHHmmss'),
      name : '${name}',   // order 테이블에 들어갈 주문명 혹은 주문 번호
       amount : amount,   // 결제 금액
       buyer_email : '',   // 구매자 email
      buyer_name :  '',   // 구매자 이름
       buyer_tel :  '0000',   // 구매자 전화번호
       buyer_addr :  '',   // 구매자 주소
       buyer_postcode :  '',   // 구매자 우편번호
       m_redirect_url : 'complete_view'   // 결제 완료 후 보낼 컨트롤러의 메소드명
   }, function(rsp) {
       if ( rsp.success ) {
          //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
          jQuery.ajax({
             url: "paymentComplete", //cross-domain error가 발생하지 않도록 주의해주세요
             type: 'GET',
             //dataType: 'json',
             contentType : "application/json;charset=UTF-8",
             async:false,
             data: {
                "pay_method" : rsp.pay_method,
                "code": $('#code').val(),
                "price" : ${price},
                "quant" : $('#amount').val(),
                "deli" : ${deli},
                "postcode" : $('#memAdd1').val(),
                "addr1" : $('#memAdd2').val(),
                "addr2" : $('#memAdd3').val(),
                "tel" : $('#memPhone').val(),
                "recipient" : $('#memName').val(),
                "name" : rsp.name,
                "image" : "upload/${image}",
                "amount" : amount
                //기타 필요한 데이터가 있으면 추가 전달
             }
             
          }).done(function(data) {
             result = data;
             return result;
             //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
             if ( everythings_fine ) {
                var msg = '결제가 완료되었습니다.';
                msg += '\n고유ID : ' + rsp.imp_uid;
                msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                msg += '\n결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                alert(msg);
             } else {
                //[3] 아직 제대로 결제가 되지 않았습니다.
                //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
             }
          });
          location.href="complete_view?orderNum="+result;
       } else {
           var msg = '결제에 실패하였습니다.';
           msg += '에러내용 : ' + rsp.error_msg;
           
           alert(msg);
       }
   });
});
</script>

   
</body>
</html>