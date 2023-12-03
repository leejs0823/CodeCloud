<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Group" %>
<%@ page import="" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단체 등록 결과</title>
</head>
<body>
    <container>
        <h2>단체 등록 결과</h2>
        <p>등록이 완료되었습니다! </p>
        
        <!-- 등록된 단체 정보 출력 -->
        <h3>등록된 단체 정보</h3>
        <%-- registeredGroup 속성을 받아와서 출력 --%>
        <% Group registeredGroup = (Group) request.getAttribute("registeredGroup"); %>
        <p>
            단체명: <%= registeredGroup.getGroupName() %><br>
            단체 소개: <%= registeredGroup.getDescription() %><br>
            <!-- 나머지 이미지 정보는 여기에 추가 -->
        </p>
        
        <!-- 메인 페이지로 이동하는 링크 -->
        <a href="index.jsp">메인 페이지로</a>
    </container>
</body>
</html>
