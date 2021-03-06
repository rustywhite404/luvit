<%@page import="java.util.List"%>
<%@page import="com.luvit.domain.StoreVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>


</head>
<body>
	<section id="ViewContainer">
	<div id="StoreListContainer">

<br><br><br>
	<h1>스토어</h1><br>
	
		<div class="store_main_banner">
		<img src="/resources/img/store_img/store_banner.png" />			
		</div>
		<br>
		
     <input type="text" name="keyword"/>
 	   <input type="button" id="searchBtn" value="search"/>
 	<c:if test="${id eq 'admin' }">
 	  <input type="button" value="상품등록" onclick="location.href='/store/storeWrite'"><br><br>
 	</c:if>    
 	   
	<!--  <table border="1">
     <tr>
       <td><a href="/store/storeList?num=1">전체</a></td>
       <td><a href="/store/storeList?num=1&cate=국/찌개/탕">국/찌개/탕</a></td>
       <td><a href="/store/storeList?num=1&cate=파스타/면류">파스타/면류</a></td>
       <td><a href="/store/storeList?num=1&cate=즉석조리">즉석조리</a></td>
       <td><a href="/store/storeList?num=1&cate=기타">기타</a></td>

     </table>  -->

        <script>

     document.getElementById("searchBtn").onclick=function(){		
    	let keyword = document.getElementsByName("keyword")[0].value;
    	console.log(keyword) 

		location.href= "/store/storeList?num=1" + "&keyword=" + keyword;
         };

     </script>
     
    
    
     <section id="content">
     

     
      <c:forEach items="${list }" var="list">
    
        <div class="thumbnail_box">
        <div class="thumb">
       <a href="/store/storeDetail?no=${list.s_pno }"> <img src="/resources/photo_upload/${list.s_thumbnail }"></a>
       </div>
      
        <div class="goodsName"><h3><a href="/store/storeDetail?no=${list.s_pno }">${list.s_product }</a></h3></div>
       <div class="goodsPrice"><h2><a href="/store/storeDetail?no=${list.s_pno }"><fmt:formatNumber value="${list.s_price }" pattern="###,###,###"/> 원</a></h2><br>

       </div>
        <div class="goodsName"><h4><a href="/store/storeDetail?no=${list.s_pno }">${list.s_subject }</a></h4></div>
       </div>
      </c:forEach>
      
 
     
     </section>
     
     <br><br><br><br><br><br>
     
     <div>
     
     <div class="clear"></div>
     
     <c:if test="${prev }">
     <span>[ <a href="/store/storeList?num=${startPageNum -1 }">이전</a> ]</span>
     </c:if>
     
     <c:forEach begin="${startPageNum }" end="${endPageNum}" var="num">
     <span>
     
     <c:if test="${select!=num }">
     	<a href="/store/storeList?num=${num}">${num}</a>
     	</c:if>
     	
     <c:if test="${select == num }">
     	<b>${num }</b>
     </c:if>
     
     </span>   
     </c:forEach>
     
      <c:if test="${next }">
     <span>[ <a href="/store/storeList?num=${endPageNum +1 }">다음</a> ]</span>
     </c:if>
     
     
     </div>
     
     

     
     </div>
	</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>