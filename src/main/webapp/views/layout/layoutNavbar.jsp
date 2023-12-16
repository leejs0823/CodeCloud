<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>

<header>
    <div class="navbar_container">
        <div id="branding">
            <a href="/CodeCloud/index.jsp" class="branding_a">
            <img class="navbar_logo" src="/CodeCloud/resources/images/cc_logo.png" alt="logo">
            <h1 class="branding_h1">CodeCloud</h1>
            </a>
        </div>
        <nav>
            <ul>
                <%
                    // 사용자 로그인 상태를 체크하기 위해 세션에서 사용자 정보 가져오기
                    User user;
                    user = (User) session.getAttribute("user");

                    // 사용자가 로그인한 경우
                    if(user != null) {
                %>
                <li><a href="/CodeCloud/views/user/userMypage.jsp">마이페이지</a></li>
                <%
                } else { // 사용자가 로그인하지 않은 경우
                %>
                <li><a href="/CodeCloud/views/Auth/authIndex.jsp">로그인</a></li>
                <%
                    }
                %>
            </ul>
        </nav>
    </div>
</header>
