<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Group" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단체 등록 결과</title>
        <link rel="stylesheet" type="text/css" href="../../resources/css/reset.css">
        <link rel="stylesheet" type="text/css" href="../../resources/css/layout/layout.css">
        <link rel="stylesheet" type="text/css" href="../../resources/css/group/groupRegisterResult.css">
</head>
<body>
    <%--헤더--%>
    <%@ include file="../layout/layoutNavbar.jsp" %>
    
    <div class="groupresult-container">
    	<div class="groupresult-header">
	        <h1>단체 등록이 신청되었습니다.</h1>
	        <p>단체가 등록되었습니다.</p>
	        <p>CodeCloud를 통해 다양한 추억 쌓아가세요 !</p>    
		</div>
		<div class="groupresult-body">
		        <!-- 등록된 단체 정보 출력 -->
		        <h3>등록된 단체 정보</h3>
		        <img class="group-image" src="../../resources/images/cc_logo.png" alt="logo">
		        <p>단체명</p>
		        <p>단체 소개글</p>
		        <%--
		        <!-- registeredGroup 속성을 받아와서 출력 -->
		        <% Group registeredGroup = (Group) request.getAttribute("registeredGroup"); %>
		        <p>
		            단체명: <%= registeredGroup.getGroupName() %><br>
		            단체 소개: <%= registeredGroup.getDescription() %><br>
		            <!-- 나머지 이미지 정보는 여기에 추가 -->
		        </p>
		        --%>
	    </div>
	    <div class="groupresult-footer">
	    		<!-- 메인 페이지로 이동하는 링크 -->
		        <a href="../main/main.jsp">메인으로</a>
	    </div>
    </div>
    
    <%--푸터--%>
    <%@ include file="../layout/layoutFooter.jsp" %>

    <%--js--%>
    <script src="./resources/common/main_script.js"></script>
    
</body>
</html>