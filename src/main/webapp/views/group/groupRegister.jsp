<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>단체 등록하기</title>
        <link rel="stylesheet" type="text/css" href="../../resources/css/reset.css">
        <link rel="stylesheet" type="text/css" href="../../resources/css/main/main.css">
        <link rel="stylesheet" type="text/css" href="../../resources/css/layout/layout.css">
</head>
<body>
    <%--헤더--%>
    <%@ include file="../layout/layoutNavbar.jsp" %>

    <%--메인--%>
    <%@ include file="../main/main.jsp" %>

    <div>   
      <h2> 단체 등록하기 </h2>
      <p> 단체만의 맞춤형 기술블로그, CODE CLOUD가 만들어드립니다! </p>
      <div>
         <!-- 이미지 관련 코드 -->         
      </div>
      <div>
         <form action="groupRegisterResult.jsp" method="post">
            <h3> 단체명 </h3>
               <input type="text" name="groupName"><br>
            
            <h3> 단체 소개 </h3>
               <input type="text" name="description"><br>
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