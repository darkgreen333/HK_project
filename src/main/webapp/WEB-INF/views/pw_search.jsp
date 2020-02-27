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
</head>
<body>

<%@ include file="header.jsp" %>
<section>
   <div id="main">
      <center>
         <div class="container">
            <div class="" style="">
               <form class="login100-form validate-form flex-sb flex-w" action="pwSearchOk" method="post" onsubmit="return formCheck()">
               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /><br/>
                  <span class="" style="font-weight: bold; font-size:40px; text-shadow:2px 2px 6px grey;">
                     비밀번호 찾기
                  </span>
                  <div class="mt-5">
                     <input class="form-control" type="text" name="memId" style="width:300px; height:50px; border:1px solid black"placeholder="아이디" id="username">
                  </div>   
                  
                  <div class="mt-3">
                     <input class="form-control" type="text" name="memEmail" style="width:300px; height:50px; border:1px solid black" placeholder="이메일 주소" id="userid">
                  </div>                  
                  <div class="mt-3">
                     <button class="btn btn-primary btn-lg" style="width:300px">
                        확인
                     </button>
                  </div>
               </form>
            </div>
         </div>
      </center>
   </div>
</section>

<%@ include file="footer.jsp" %>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>