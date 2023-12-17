<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Group" %>
<!-- 이미지 업로드를 위한 코드 -->
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Code Cloud</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout/layout.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/group/groupRegisterResult.css">
</head>
<body>
    <%--헤더--%>
    <%@ include file="../layout/layoutNavbar.jsp" %>
    
    <div class="groupresult-container">
    	<div class="groupresult-header">
	        <h1>단체가 등록되었습니다.</h1>
	        <p>이제 초대 링크를 통해 구성원을 초대해보세요!</p>    
	      	<div class="cloudImg">
				<img class="leftcloudImg" src="/CodeCloud/resources/images/cc_logo.png">
				<img class="centercloudImg" src="/CodeCloud/resources/images/cc_logo.png">
				<img class="rightcloudImg" src="/CodeCloud/resources/images/cc_logo.png">
			</div>
		</div>
	    <div class="groupresult-body">
	        <h3>등록된 단체 정보</h3>
	        <% Group registeredGroup = (Group) request.getAttribute("registeredGroup"); 
	        if(registeredGroup != null ){
	        	
	        %>
	        <p class="nameOutput"> <%= registeredGroup.getGroupName() %></p>
	        <p class="descriptionOutput"> <%= registeredGroup.getDescription() %></p>
	        <%-- <img class="group-thumbnail" src="<%= registeredGroup.getGroupThumbnail() %>" alt="단체 썸네일">--%>
	    <%
	        } else{	    
	    %>
	    	<p class="nameOutput"> 단체명 </p>
	    	<p class="descriptionOutput">단체 소개</p>
	   <% 
	        }
	    %>
	    </div>
	    <div class="groupresult-footer">
	    		<!-- 메인 페이지로 이동하는 링크 -->
		        <a href="../../index.jsp" class="main-link">메인으로</a>
	    </div>
    </div>
    
    <%--푸터--%>
    <%@ include file="../layout/layoutFooter.jsp" %>

    <%--js--%>
	<script src="${pageContext.request.contextPath}/resources/js/main_script.js"></script>
</body>
</html>