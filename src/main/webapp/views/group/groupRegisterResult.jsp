<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Group" %>
<!-- 이미지 업로드를 위한 코드 -->
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<!--  이미지 업로드 코드 -->
<%
	MultipartRequest multi = new MultipartRequest(request, "C:\\upload", 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());

	Enumeration params = multi.getParameterNames();
	
	while(params.hasMoreElements()){
		String name = (String) params.nextElement();
		String value = multi.getParameter(name);
		out.println(name + " =  " + value + "<br>" );
	}
	
	out.println("--------------------------<br>");
	
	Enumeration files = multi.getFileNames();
	
	while(files.hasMoreElements()){
		String name = (String) files.nextElement();
		String filename = multi.getFilesystemName(name);
		String original = multi.getOriginalFileName(name);
		String type = multi.getContentType(name);
		File file = multi.getFile(name);
		
		out.println("요청 파라미터 이름 : " + name + "<br>");
		out.println("실제 파일 이름 : " + original + "<br>");
		out.println("저장 파일 이름 : " + filename + "<br>");
		out.println("파일 콘텐츠 유형 : " + type + "<br>");
		
		if (file != null){
			out.println("파일 크기 : " + file.length());
			out.println("<br>");
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Code Cloud</title>
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
	        <p>이제 CodeCloud를 이용해 보세요!</p>    
		</div>
	<%-- 
	    등록된 단체 정보 출력
	    <div class="groupresult-body">
	        <h3>등록된 단체 정보</h3>
	        registeredGroup 속성을 받아와서 출력
	        <% Group registeredGroup = (Group) request.getAttribute("registeredGroup"); %>
	        <p>단체명: <%= registeredGroup.getGroupName() %></p>
	        <p>단체 소개: <%= registeredGroup.getDescription() %></p>
	        기타 이미지 정보 등을 추가할 수 있습니다
	        <img class="group-thumbnail" src="<%= registeredGroup.getGroupThumbnail() %>" alt="단체 썸네일">
	    </div>
	--%>

	    <div class="groupresult-footer">
	    		<!-- 메인 페이지로 이동하는 링크 -->
		        <a href="../../index.jsp" class="main-link">메인으로</a>
	    </div>
    </div>
    
    <%--푸터--%>
    <%@ include file="../layout/layoutFooter.jsp" %>

    <%--js--%>
    <script src="./resources/common/main_script.js"></script>
</body>
</html>