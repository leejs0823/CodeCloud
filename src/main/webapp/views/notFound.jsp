<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isErrorPage = "true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Code Cloud</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main/main.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout/layout.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/notFound.css">
</head>
<body>
		<%--헤더--%>
	    <%@ include file="../views/layout/layoutNavbar.jsp" %>
	    <div class="notFoundWrapper">
		     <img src="${pageContext.request.contextPath}/resources/images/notfound_logo.png" class="notfound_logo"/>
		     <h1 class="notfound_content" style="text-align:center;">
		     404 Not Found<br/>
		     <br/>
		    	Code Cloud에 없는 페이지에요!
		     </h1>
	    </div>
</body>
</html>