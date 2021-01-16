<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
</head>
<body>
	<section id="ViewContainer">
	<h4>게시판 페이지</h4>
	<fieldset>
		<!-- action="" 속성값이 없을 경우 자기 자신 페이지(/member/login(post))를 호출함 -->
		<!-- 오후에 테스트해봄 -->
<!-- 		<form action="/qna/insert" method="post" enctype="multipart/form-data"> -->
	  <form action="/qna/insert" method="post">
	       닉네임 : <input type="text" name="q_nickname"> <br>
	       제목 : <input type="text" name="q_subject"> <br>
	       내용 : <textarea rows="10" cols="25" name="q_contents"></textarea> <br> <br>  
<!-- 	       <textarea rows="10" cols="25" name="q_contents"></textarea> <br><br><br> -->
<!--            <input type="text" name="q_contents">                             -->
<!-- 	       파일 : <input type="file" name="file"> <br>   -->

	        
           비밀여부 : <input type="radio" name="q_secret" value="1">선택
	               <input type="radio" name="q_secret" value="0" checked>선택 안함<br>
	       비밀번호 : <input type="password" name="q_pw"> <br>
	  
	   <input type="submit" value="글쓰기" >
	  
	  </form>
	</fieldset>
	</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>