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
<style>
table {
	margin-left:auto;
	margin-rigth:auto;
}
table td {
	font-size:15px;
	height:50px;
}
.container {
	margin-top:100px;
}

.mainBox {
	overflow-x:auto;
	width:100%;
	height:50px;
	display:table;
}
.contentBox {
	display:table-cell;
	vertical-align:middle;
	font-size: 18px;
}
</style>
</head>
<body>

<%@ include file="header.jsp" %>

<section>
	<div id="main">
		<div class="container">
			<h1 style="text-align:center">회원 정보</h1>
			<div class="table-responsive">
				<form action="memberUpdate" method="post" id="infoForm">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<table class="table">
						<tr>
							<td bgcolor="#f5f5f5" align="center" style="width:25%">
								<div class="mainBox">
									<div class="contentBox">
										<strong>이름</strong>
									</div>
								</div>
								
							</td>
							<td>
								<div class="mainBox">
									<div class="contentBox">
										${user.memName}
									</div>
								</div>						
							</td>
						</tr>
						<tr>
							<td bgcolor="#f5f5f5" align="center">
								<div class="mainBox">
									<div class="contentBox">
										<strong>ID</strong>
									</div>
								</div>
							</td>
							<td>
								<div class="mainBox">
									<div class="contentBox">
										<input type="hidden" class="form-control" name="memId" value="${user.memId}"/>${user.memId}
									</div>
								</div>
							</td>
						</tr>	
						<tr>
							<td bgcolor="#f5f5f5" align="center">
								<div class="mainBox">
									<div class="contentBox">
										<strong>이메일</strong>
									</div>
								</div>
							</td>
							<td>
								<div class="mainBox">
									<div class="contentBox">
										<input type="text" class="form-control" name="memEmail" value="${user.memEmail}" style="width:300px" required/>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td bgcolor="#f5f5f5" align="center">
								<div class="mainBox">
									<div class="contentBox">
										<strong>전화 번호</strong>
									</div>
								</div>
							</td>
							<td>
								<div class="mainBox">
									<div class="contentBox">
										<input type="text" class="form-control" name="memPhone" value="${user.memPhone}" style="width:300px" required/>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td bgcolor="#f5f5f5" align="center">
								<div class="mainBox">
									<div class="contentBox">
										<strong>우편 번호</strong>
									</div>
								</div>
							</td>
							<td>
								<div class="mainBox">
									<div class="contentBox">
										<input type="text" class="form-control col-sm-2" style="display:inline" name="memAdd1" id="memAdd1" value="${user.memAdd1}" style="width:300px" readonly required/>
										<button type="button" class="btn btn-secondary ml-2" onclick="DaumPostcode()">우편 번호 확인</button>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td bgcolor="#f5f5f5" align="center">
								<div class="mainBox">
									<div class="contentBox">
										<strong>주소</strong>
									</div>
								</div>
							</td>
							<td>
								<div class="mainBox">
									<div class="contentBox">
										<input type="text" class="form-control" name="memAdd2" id="memAdd2" value="${user.memAdd2}" style="width:500px" readonly required/>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td bgcolor="#f5f5f5" align="center">
								<div class="mainBox">
									<div class="contentBox">
										<strong>상세 주소</strong>
									</div>
								</div>
							</td>
							<td>
								<div class="mainBox">
									<div class="contentBox">
										<input type="text" class="form-control" name="memAdd3" id="memAdd3" value="${user.memAdd3}" style="width:500px" required/>
									</div>
								</div>
							</td>
						</tr>
					</table>
					<div style="text-align:center">
						<br/><button type="submit" class="btn btn-secondary btn-lg" id="modify">회원 정보 수정</button>
						<button type="button" class="btn btn-secondary btn-lg" id="cancel">취소</button>
					</div>
				</form>
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
<!-- 다음api -->
<script src='https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js'></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
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

$(document).ready(function(){
	$("#modify").click(function(e){
		e.preventDefault();
		swal({
		     title: "정말 변경하시겠습니까?",
		     icon: "info", //"info,success,warning,error" 중 택1
		     buttons: ["취소", "확인"],
		}).then((확인) => {
			
		     if (확인) {
		    	swal({
		  			title: "변경되었습니다.",
		  			icon: "success",
		  			button: "확인"
				}).then((확인) => {
					if(확인) {
						$("#infoForm").submit();
					}
				});
		     }
		});
		 
	});
	$("#cancel").click(function(){
		location.href="myPage";
	});
});

</script>
</body>
</html>