<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Group" %>
<%@ page import="dao.GroupDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CodeCloud</title>
        <link rel="stylesheet" type="text/css" href="/CodeCloud/resources/css/reset.css">
        <link rel="stylesheet" type="text/css" href="/CodeCloud/resources/css/group/groupAdmin.css">
        <link rel="stylesheet" type="text/css" href="/CodeCloud/resources/css/layout/layout.css">
</head>
<body>
    <%--헤더--%>
    <%@ include file="../layout/layoutNavbar.jsp" %>
	
	<%-- 그룹관리자 페이지 --%>
	<% 
	GroupDAO groupDAO = new GroupDAO();
	int id = 1;
	Long groupId = Long.valueOf(id);
	Group group = (Group)groupDAO.getGroupById(groupId);
	
	%>
	<main>
		<div class="background_photo"></div>
		<div class="profile">
			<div class="profile_edit">	
				<div class="profile_photo"></div>
				<h1 class="group_name"><%=group.getGroupName() %> </h1>
			</div>
			<p class = "group_description"><%=group.getDescription() %></p>
			<button type="button" class = "edit_button" onClick= "location.href = '/CodeCloud/views/group/groupAdminEdit.jsp'">프로필 편집</button>
		</div>
		<div class="content">
		<div class="post_content">
			<h2>게시물</h2>
			<div class = "categories">
				<div class = "category" id = "category_all">전체</div>
				<div class = "category">카테고리 1</div>
				<div class = "category">카테고리 2</div>
			</div>
			<div class="frame">
				<div class="post" >
					<div class="thumbnail"></div>
					<p class="post_title">제목을 입력하세요</p>
					<p class="detail">어쩌구저쩌구궁시렁궁시렁어쩌구저쩌구궁시렁</p>
					<div class="writer_and_like">
						<div class="writer">
							<p>작성자 </p>
						</div>
						<div class="like">
							<p>0</p>
							<img alt="heart" src="/CodeCloud/resources/images/icons/like_icon.png">
						</div>
					</div>
				</div>
				<div class="post">
					<div class="thumbnail"></div>
					<p class="post_title">제목을 입력하세요</p>
					<p class="detail">어쩌구저쩌구궁시렁궁시렁어쩌구저쩌구궁시렁</p>
					<div class="writer_and_like">
						<div class="writer">
							<p>작성자 </p>
						</div>
						<div class="like">
							<p>0</p>
							<img alt="heart" src="/CodeCloud/resources/images/icons/like_icon.png">
						</div>
					</div>
				</div>
				<div class="post">
					<div class="thumbnail"></div>
					<p class="post_title">제목을 입력하세요</p>
					<p class="detail">어쩌구저쩌구궁시렁궁시렁어쩌구저쩌구궁시렁</p>
					<div class="writer_and_like">
						<div class="writer">
							<p>작성자 </p>
						</div>
						<div class="like">
							<p>0</p>
							<img alt="heart" src="/CodeCloud/resources/images/icons/like_icon.png">
						</div>
					</div>
				</div>
			</div>
			<div class="frame">
				<div class="post" >
					<div class="thumbnail"></div>
					<p class="post_title">제목을 입력하세요</p>
					<p class="detail">어쩌구저쩌구궁시렁궁시렁어쩌구저쩌구궁시렁</p>
					<div class="writer_and_like">
						<div class="writer">
							<p>작성자 </p>
						</div>
						<div class="like">
							<p>0</p>
							<img alt="heart" src="/CodeCloud/resources/images/icons/like_icon.png">
						</div>
					</div>
				</div>
				<div class="post">
					<div class="thumbnail"></div>
					<p class="post_title">제목을 입력하세요</p>
					<p class="detail">어쩌구저쩌구궁시렁궁시렁어쩌구저쩌구궁시렁</p>
					<div class="writer_and_like">
						<div class="writer">
							<p>작성자 </p>
						</div>
						<div class="like">
							<p>0</p>
							<img alt="heart" src="/CodeCloud/resources/images/icons/like_icon.png">
						</div>
					</div>
				</div>
				<div class="post">
					<div class="thumbnail"></div>
					<p class="post_title">제목을 입력하세요</p>
					<p class="detail">어쩌구저쩌구궁시렁궁시렁어쩌구저쩌구궁시렁</p>
					<div class="writer_and_like">
						<div class="writer">
							<p>작성자 </p>
						</div>
						<div class="like">
							<p>0</p>
							<img alt="heart" src="/CodeCloud/resources/images/icons/like_icon.png">
						</div>
					</div>
				</div>
			</div>
			<div class="frame">
				<div class="post" >
					<div class="thumbnail"></div>
					<p class="post_title">제목을 입력하세요</p>
					<p class="detail">어쩌구저쩌구궁시렁궁시렁어쩌구저쩌구궁시렁궁시렁어쩌구저쩌구</p>
					<div class="writer_and_like">
						<div class="writer">
							<p>작성자 </p>
						</div>
						<div class="like">
							<p>0</p>
							<img alt="heart" src="/CodeCloud/resources/images/icons/like_icon.png">
						</div>
					</div>
				</div>
				<div class="post">
					<div class="thumbnail"></div>
					<p class="post_title">제목을 입력하세요</p>
					<p class="detail">어쩌구저쩌구궁시렁궁시렁어쩌구저쩌구궁시렁궁시렁어쩌구저쩌구</p>
					<div class="writer_and_like">
						<div class="writer">
							<p>작성자 </p>
						</div>
						<div class="like">
							<p>0</p>
							<img alt="heart" src="/CodeCloud/resources/images/icons/like_icon.png">
						</div>
					</div>
				</div>
				<div class="post">
					<div class="thumbnail"></div>
					<p class="post_title">제목을 입력하세요</p>
					<p class="detail">어쩌구저쩌구궁시렁궁시렁어쩌구저쩌구궁시렁궁시렁어쩌구저쩌구</p>
					<div class="writer_and_like">
						<div class="writer">
							<p>작성자 </p>
						</div>
						<div class="like">
							<p>0</p>
							<img alt="heart" src="/CodeCloud/resources/images/icons/like_icon.png">
						</div>
					</div>
				</div>
			</div>

		</div>
		<div class = "member_content">
			<h2>MEMBER</h2>
			<div class = "searchbar">
			<form>
				<input type = "text" class = "search_input" name = "keyword" placeholder = "이름 검색"/>
				<input type = "submit" class = "search_button" value = "검색"/>
			</form>
			</div>
			<div class = "member_list">
				<div class = "member">
					<div class = "member_name">
						<p>이름</p>
						<div class = "admin">[관리자]</div>
					</div>
				</div>
				<div class = "member">
					<div class = "member_name">
						<p>이름</p>
					<div class = "general">[일반]</div>
					</div>
					<button type="button" class = "delete_button" onclick="showConfirmation()">삭제</button>
				</div>
				<div class = "member">
					<div class = "member_name">
						<p>이름</p>
					<div class = "general">[일반]</div>
					</div>
					<form>
						<input type="button" value = "삭제" class = "delete_button" onclick="showConfirmation()"/>
					</form>
				</div>
				<div class = "member">
					<div class = "member_name">
						<p>이름</p>
					<div class = "general">[일반]</div>
					</div>
					<form>
						<input type="button" value = "삭제" class = "delete_button" onclick="showConfirmation()"/>
					</form>
				</div>
				<div class = "member">
					<div class = "member_name">
						<p>이름</p>
					<div class = "general">[일반]</div>
					</div>
					<form>
						<input type="button" value = "삭제" class = "delete_button" onclick="showConfirmation()"/>
					</form>
				</div>
				<div class = "member">
					<div class = "member_name">
						<p>이름</p>
					<div class = "general">[일반]</div>
					</div>
					<form>
						<input type="button" value = "삭제" class = "delete_button" onclick="showConfirmation()"/>
					</form>
				</div>
				<div class = "member">
					<div class = "member_name">
						<p>이름</p>
					<div class = "general">[일반]</div>
					</div>
					<form>
						<input type="button" value = "삭제" class = "delete_button" onclick="showConfirmation()"/>
					</form>
				</div>
				<div class = "member">
					<div class = "member_name">
						<p>이름</p>
					<div class = "general">[일반]</div>
					</div>
					<form>
						<input type="button" value = "삭제" class = "delete_button" onclick="showConfirmation()"/>
					</form>
				</div>
				<div class = "member">
					<div class = "member_name">
						<p>이름</p>
					<div class = "general">[일반]</div>
					</div>
					<form>
						<input type="button" value = "삭제" class = "delete_button" onclick="showConfirmation()"/>
					</form>
				</div>
				<div class = "member">
					<div class = "member_name">
						<p>이름</p>
					<div class = "general">[일반]</div>
					</div>
					<form>
						<input type="button" value = "삭제" class = "delete_button" onclick="showConfirmation()"/>
					</form>
				</div>
			</div>

			<div class = "pagination">
			<%-- 구현 예정 --%>
			</div>
			<div class="group_invite">
				<p>링크를 통해 새 멤버를 추가하세요!</p>
				<p class="copy_link" onClick = "copyLink()">초대 링크 복사하기</p>
			</div>
		</div>
		</div>
	</main>
    <%--푸터--%>
    <%@ include file="../layout/layoutFooter.jsp" %>

    <%--js--%>
    <script src="/CodeCloud/resources/js/group/groupDetail.js"></script>
</body>
</html>
