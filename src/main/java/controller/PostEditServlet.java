package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PostDAO;
import model.Post;
import model.User;

/**
 * Servlet implementation class PostEditServlet
 */
@WebServlet("/postEdit")
public class PostEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // 게시물 ID, 제목, 내용을 파라미터에서 추출
	    int postId = Integer.parseInt(request.getParameter("postId"));
	    String title = request.getParameter("title");
	    String content = request.getParameter("content");

	    // 현재 로그인한 사용자의 ID를 세션에서 가져옴
	    User loggedInUser = (User) request.getSession().getAttribute("user");
	    
	    PostDAO postDAO = new PostDAO();
	    try {
	        Post post = postDAO.getPostById(postId);
	            post.setTitle(title);
	            post.setContent(content);
	            postDAO.updatePost(post);
	            response.sendRedirect("/CodeCloud/views/post/postDetail.jsp?postId=" + postId); // 업데이트 후 게시물 상세 페이지로 리디렉션
	        }  catch (SQLException e) {
	        e.printStackTrace();
	        response.sendRedirect("error.jsp"); // 데이터베이스 오류 발생 시 에러 페이지로 리디렉션
	    }
	}

}
