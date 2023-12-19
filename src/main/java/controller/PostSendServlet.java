package controller;

import dao.PostDAO;
import model.Post;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/post")
public class PostSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        // 세션에서 User 객체를 가져옴
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // User 객체가 없다면 로그인 페이지로 리다이렉트
            response.sendRedirect("/CodeCloud/views/Auth/authIndex.jsp");
            return;
        }
        
        // User 객체에서 userId를 가져옴
        Long userId = user.getId();
        // 폼 파라미터를 받아옴
        String title = request.getParameter("title");
        String content = request.getParameter("content");

		String groupIdParam = request.getParameter("groupId"); 
		Long groupId = null;
		if (groupIdParam != null && !groupIdParam.isEmpty()) 
		{ 
			groupId = Long.valueOf(groupIdParam); 
		}

        // 게시물 객체를 생성하고 데이터베이스에 저장
        Post newPost = new Post();
        newPost.setWriter(userId);
        //newPost.setGroupId(groupId);
        newPost.setTitle(title);
        newPost.setContent(content);
        newPost.setGroupId(groupId);

        PostDAO postDAO = new PostDAO();
        try {
            Long postId = postDAO.savePost(newPost);
            if (postId != null) {
                // 성공적으로 게시물을 저장했다면 게시물 상세 페이지로 리다이렉트
                response.sendRedirect("/CodeCloud/views/post/postDetail.jsp?postId=" + postId);
            } else {
                // 게시물 저장에 실패했다면 오류 메시지를 사용자에게 보여주거나 로깅
                throw new SQLException("게시물 생성 실패");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // 데이터베이스 오류가 발생했다면 내부 서버 오류로 응답
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred while creating the post");
        }
    }
}
