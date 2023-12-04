<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>단체 등록하기</title>
        <link rel="stylesheet" type="text/css" href="../../resources/css/reset.css">
        <link rel="stylesheet" type="text/css" href="../../resources/css/layout/layout.css">
        <link rel="stylesheet" type="text/css" href="../../resources/css/group/groupRegister.css">
</head>
<body>
    <%--헤더--%>
    <%@ include file="../layout/layoutNavbar.jsp" %>

	<div class="groupregister-container">
	    <div class="groupregister-header">   
	      <h1> 단체 등록하기 </h1>
	      <p> 단체만의 맞춤형 기술블로그, CODE CLOUD가 만들어드립니다! </p>
	     </div>
	     <div class="groupregister-body">
		         <!-- 이미지 관련 코드 --> 
		         <form action="groupRegisterResult.jsp" method="post">
		            <h3> 단체명 </h3>
		               <input type="text" name="groupName"><br>
		            
		            <h3> 단체 소개 </h3>
		               <input type="text"  name="description"><br>
		             <input type="submit" value="단체 신청" />
		         </form>
		         
		         <!-- 공개 설정 : 후순위 기능 -->
	      </div>
	</div>
    <%--푸터--%>
    <%@ include file="../layout/layoutFooter.jsp" %>
    <%--js--%>
    <script src="./resources/common/main_script.js"></script>
    
    
</body>
</html>