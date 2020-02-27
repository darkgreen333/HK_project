<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>상품 리스트</title>




<style>
/*
* { 
 font-family:'Nanum Myeongjo', serif;
 }
 */
 ul { 
 	padding:0; 
 	margin:0; 
 	list-style:none;  
}




 section#container { 
 	padding:20px 0; 
 	/*
 	border-top:2px solid #eee; 
 	border-bottom:2px solid #eee; */
 }
 section#container::after {
 	content:""; 
 	display:block; 
 	clear:both; 
 }


 
 #container_box  .talbe table tr:hover {
 	background-color: #f5f5f5;
 }

 .thumb{
 	width:250px;
	height:150px;
 }
 #category {
	color : #606060;
/*	text-align:center;*/
}
.li2 {
	list-style: none; 
	float: left;
    position: relative;
    left: 50%;; 
	padding: 6px;
}

#selectBox{
	height:28px;
	width:100px;
	border-width:2px; 
	
    border-color: #d2a679;
}

#keywordInput{
	border-style:none;
	border-bottom-style: solid;
  	border-bottom-color: #d2a679;
	/*border-bottom : 2px ridge  #d2a679;*/
}

#searchBtn{
	border:none;
	background-color:white;
}
</style>

</head>
<body>

<!-- header -->
<%@ include file="header.jsp" %>


<section id="container" class="container">
	<div id="main">
	<h3 id="category"><b>&nbsp;상품 목록</b></h3>
	
	<!-- 검색기능 -->
		  <div class="search" style="text-align:right"> 
		    <select name="searchType" id="selectBox">
		      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-------</option>
		      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>구분 번호</option>
		      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>상품 이름</option>
		      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>상품 코드</option>
		    </select>
		
		    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
		
		    <button id="searchBtn" type="button"><i class="fas fa-search"></i></i></button>
		    <script>
		      $(function(){
		        $('#searchBtn').click(function() {
		          self.location = "register_list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
		        });
		      });   
		    </script>
		  </div><!-- 검색 끝 -->
		  
	<br>
	<br>
	
	<div id="container_box" >
		<table class="table table-hover">
		 <thead>
			  <tr>
				   <th style="text-align : center">구분 번호</th>
				   <th style="text-align : center">상품 코드</th>
				   <th style="text-align : center">썸네일</th>
				   <th style="text-align : center">상품 정보</th>
				   <th style="text-align : center">재고</th>
				   <th style="text-align : center">배달비</th>
				   <th style="text-align : center">가격</th>
				   <th style="text-align : center">등록일</th>
			  </tr>
		 </thead>
		 <tbody>
			  <c:forEach items="${list}" var="list">
				  <tr>
				   <td style="vertical-align:middle">${list.items_cate}</td>
				   <td style="vertical-align:middle">
				   <a href="register_retrieve?n=${list.items_code}">${list.items_code}</a>
				   </td >
				   <td style="vertical-align:middle"><img src="upload/${list.items_image}" class="thumb"/></td>
				   <td style="vertical-align:middle" >
				   <a href="register_retrieve?n=${list.items_code}" style="padding:10px;">${list.items_name}</a>
				   </td>
				   <td style="vertical-align:middle">${list.items_stock}</td>
				   <td style="vertical-align:middle">
				   <fmt:formatNumber value="${list.items_deli}" pattern="###,###,###"/>
				   </td>
				   <td style="vertical-align:middle">
				   		<fmt:formatNumber value="${list.items_price}" pattern="###,###,###"/>
				   </td>
				   <td style="vertical-align:middle">
				  	<fmt:formatDate value="${list.items_date}" pattern="yyyy-MM-dd" />
				   </td>
				  </tr>   
			  </c:forEach>
		 </tbody>
	</table>
		
	
		<div id="page"> <!-- 페이징 처리 -->
		  <ul>
		    <c:if test="${pageMaker.prev}">
		    	<li class="li2"><a href="register_list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
		    </c:if> 
		
		    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		    	<li class="li2"><a href="register_list${pageMaker.makeSearch(idx)}">${idx}</a></li>
		    </c:forEach>
		
		    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		    	<li class="li2"><a href="register_list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
		    </c:if> 
		  </ul>
		</div> <!-- 페이징 처리 끝 -->
		
	
		
  
	</div>
</div>


</section>



<!-- footer -->
<%@ include file="footer.jsp" %>

</body>
</html>