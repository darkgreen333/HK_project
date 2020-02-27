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
<title>SUPLLEX-myPage</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet">
<style>
.modal {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}

.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}
</style>

</head>
<body>

<%@ include file="header.jsp" %>

<section>
	<div id="main" style="margin-top:150px;">
	
		<div class="wrap container" style="background-color:#EEEFEC">
			<nav id="nav">
				<div class="row">
					<div class="col-3 text-center" style="width:222px; height:222px"><button style="width:222px; height:222px; background-color:white" class="btn" onclick="location.href='memberModify'"><i class="ri-edit-2-fill" style="font-size:100px"></i><br/>회원정보수정</button></div>
					<div class="col-3 text-center" style="width:222px; height:222px"><button style="width:222px; height:222px; background-color:white" class="btn" id="modal_show" data-toggle="modal" data-target="#exampleModal"><i class="ri-shield-keyhole-line" style="font-size:100px"></i><br/>비밀번호변경</button></div>
					<div class="col-3 text-center" style="width:222px; height:222px"><button style="width:222px; height:222px; background-color:white" class="btn" onclick="location.href='orderList_view'"><i class="fas fa-truck mb-3" style="font-size:100px"></i><br/>주문조회</button></div>
					<div class="col-3 text-center" style="width:222px; height:222px"><button style="width:222px; height:222px; background-color:white" class="btn" onclick="location.href='memberDelete_view'"><i class="fas fa-user-times mb-3" style="font-size:100px"></i><br/>회원탈퇴</button></div>
				</div>
			</nav>
		</div>
		<!-- modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="exampleModalLabel">현재 비밀번호를 입력해주세요</h3>
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                    <span aria-hidden="true">&times;</span>
		                </button>
		            </div>
		            <form action="memberPwChange_view" method="post" id="form_check">
		            	<div class="modal-body">
		            		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		                	<input type="password" class="form-control" id="memberPw" name="memPw"/>
		            	</div>
		            	<div class="modal-footer">
		            		<button type="button" class="btn btn-primary" id="confirm">확인</button>
		                	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		            	</div>
		            </form>
		        </div>
		    </div>
		</div>
	</div>
</section>
<br><br><br><br><br><br><br><br>
<%@ include file="footer.jsp" %>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$(document).ready(function() {
    $("#modal_show").click(function() {
        $("#exampleModal").modal("show");
    });
    $("#confirm").click(function(){
    	if($("#memberPw").val() == ""){
    		swal({
				title:"비밀번호를 입력하세요.",
				icon:"info"
			}).then((value) => {
				$("#memberPw").focus();
			});
			return false;
    	}
    	$.ajax({
    		url : "pwCheck",
    		type : "POST",
    		data : $("#form_check").serialize(),
    		success : function(data) {
    			if(data==false){
    				swal({
						title:"비밀번호가 맞지않습니다.",
						icon:"info"
					}).then((value) => {
						$("#memberPw").focus();
					});
					return false;
				}else {
					$("#form_check").submit();
				}
    		}
    	});
    });
});
</script>
</body>
</html>