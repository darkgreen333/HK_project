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
      <table width="300" height="300" align= "center">
      <center>  
              <br> <br>
              <div style="text-align:center;">
                  <tr>        
                      <td>
                      <center>
                          <form action="pass_change${memEmail}" method="post">
                          
                          <center>
                              <br>
                              <div style="width:500px">
                              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                  <span style="font-size:20px">변경할 비밀번호 입력</span> <br><br> <input class="form-control" type ="text" name ="memPw" style="width:300px" placeholder ="비밀번호를 입력하세요." >
                              </div>                                        
       
                              <br> <br>
                              <button type="submit" class="btn btn-primary">비밀번호 변경</button>
       
                              </div>
                          </td>
                      </tr>
                          </center>
                  </table>
              </form>
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