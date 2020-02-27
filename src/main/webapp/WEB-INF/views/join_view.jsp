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
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet">
<style>
label {
	font-family: Nanum Gothic ;
	font-size:20px;
}
</style>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container mt-5">
	<h1 class="text-center" style="font-size:40px; font-family:Impact">SUPLLEX 회원가입</h1>
	<form class="form-horizontal" action="signUp" method="post" id="signUpForm">
		<table class="table table-bordered">
			<tr>
				<td>
					<div class="form-group">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /><br/>
	      				<label for="id" class="col-sm-2 control-label">ID</label>
	      				<div class="col-sm-6" style="font-family:Nanum Gothic;">
		        			<input class="form-control" type="text" style="height:35px; width:200px; display:inline; font-size:15px;" placeholder="" id="memberId" name="memId" required autofocus>
		        			<input type="button" style="height:35px; width:100px; font-size:15px; margin-left:10px" id="check" value="중복확인">
		        			<p id="memIdCheck" style="font-size:20px; margin-top:10px">
	      				</div>
	    			</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-group">
	      				<label for="pw" class="col-sm-2 control-label">비밀번호</label>
	      				<div class="col-sm-6" style="font-family:Nanum Gothic;">
	        				<input type="password" class="form-control" style="height:35px; width:250px; font-size:15px" placeholder="" id="memberPw" name="memPw" onchange="isSame()" required>
	      				</div>
	    			</div>
				</td>
			</tr>
	    	<tr>
	    		<td>
	    			<div class="form-group">
	      				<label for="pw2" class="col-sm-2 control-label">비밀번호 확인</label>
	      				<div class="col-sm-6" style="font-family:Nanum Gothic;">
	        				<input type="password" class="form-control" style="height:35px; width:250px; font-size:15px" placeholder="" id="memberPw2" name="memPw2" onchange="isSame()" required><span id="same" style="font-size:20px; margin-top:10px"></span>
	      				</div>
	    			</div>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>
	    			<div class="form-group">
	      				<label for="name" class="col-sm-2 control-label">이름</label>
	      				<div class="col-sm-6" style="font-family:Nanum Gothic;">
	        				<input type="text" class="form-control" style="height:35px; width:250px; font-size:15px" placeholder="" id="memName" name="memName" required>
	      				</div>
	    			</div>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>
	    			<div class="form-group">
	      				<label for="phone" class="col-sm-2 control-label">전화번호</label>
	      				<div class="col-sm-6" style="font-family:Nanum Gothic;">
	        				<input type="text" class="form-control" style="height:35px; width:250px; font-size:15px" placeholder="" id="memPhone" name="memPhone" required>
	      				</div>
	    			</div>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>
	    			<div class="form-group">
	      				<label for="add1" class="col-sm-2 control-label">우편번호</label>
	      				<div class="col-sm-6" style="font-family:Nanum Gothic;">
	        				<input type="text" class="form-control" style="height:35px; width:200px; display:inline; font-size:15px" placeholder="" id="memAdd1" name="memAdd1" readonly>
	        				<input type="button" onclick="DaumPostcode()" style="height:35px; width:150px; font-size:15px; margin-left:10px" value="우편번호 찾기">
	      				</div>
	    			</div>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>
	    			<div class="form-group">
		      			<label for="add2" class="col-sm-2 control-label">주소</label>
		      			<div class="col-sm-6" style="font-family:Nanum Gothic; ">
		        			<input type="text" class="form-control" style="height:35px; width:400px; font-size:15px;" placeholder="" id="memAdd2" name="memAdd2" readonly>
		      			</div>
	    			</div>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>
	    			<div class="form-group">
		      			<label for="add3" class="col-sm-2 control-label">상세주소</label>
		      			<div class="col-sm-6" style="font-family:Nanum Gothic;">
		        			<input type="text" class="form-control" style="height:35px; width:400px; font-size:15px;" placeholder="" id="memAdd3" name="memAdd3" required>
		      			</div>
	    			</div>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>
	    			<div class="form-group">
	      				<label for="email" class="col-sm-2 control-label">이메일</label>
	      				<div class="col-sm-6" style="font-family:Nanum Gothic;">
	        				<input type="email" class="form-control" style="height:35px; width:400px; font-size:15px" placeholder="" id="memEmail" name="memEmail" required>
	      				</div>
	    			</div>
	    		</td>
    	</table>
    	<div class="form-group" >
     		<div class="col-sm-12 text-center mt-5" style="font-family:Nanum Gothic;">
     			<input type="submit" value="회원가입" class="btn btn-dark btn-lg" style="height:50px; width:150px; font-size:20px"id="test">&nbsp;&nbsp;&nbsp;
     			<button type="button" onclick="history.go(-1);" class="btn btn-light" style="height:50px; width:150px; font-size:20px">취소</button>
			</div>
	    </div>	
  	</form>
</div>

<%@ include file="footer.jsp" %>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- 다음api -->
<script src='https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js'></script>
<script>


$(document).ready(function(){
	$("#check").click(function(){
		$.ajax({
			url: "idCheck",
			type: "GET",
			data: {
				"memId":$("#memberId").val()
			},
			success: function(data) {
				if(data == 0 && $.trim($("#memberId").val()) != '') {
					idx = true;
					$("#memberId").attr("readonly",true);
					var result = "<p style='color:blue'>사용가능한 아이디 입니다</p>"
					
					$("#memIdCheck").empty();
					$("#memIdCheck").append(result);
				}
				else {
					var result = "<p style='color:red'>사용 불가능한 아이디 입니다</p>"
					
					$("#memIdCheck").empty();
					$("#memIdCheck").append(result);
				}
			},
			error: function() {
				alert("서버에러");
			}
		});
	});
	$("#test").click(function(){
		var memPw = $("#memberPw").val();
		var memPw2 = $("#memberPw2").val();
		if(memPw != memPw2) {
			alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요.");
			$("#memberPw2").focus();
			return false;
		}
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

function isSame() {
	if(document.getElementById("memberPw").value!="" && document.getElementById("memberPw2").value!="") {
		if(document.getElementById("memberPw").value==document.getElementById("memberPw2").value) {
			document.getElementById("same").innerHTML="비밀번호가 일치합니다.";
			document.getElementById("same").style.color="blue";
		}
		else {
			document.getElementById("same").innerHTML="비밀번호가 일치하지 않습니다.";
			document.getElementById("same").style.color="red";
		}
	}
}
</script>

</body>
</html>