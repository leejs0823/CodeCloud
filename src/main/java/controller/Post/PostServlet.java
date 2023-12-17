package controller.Post;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Post;
/**
 * Servlet implementation class PostServlet
 */
@WebServlet("/newpost")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostServlet() {
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
	    // request의 인코딩을 UTF-8로 설정합니다.
	    request.setCharacterEncoding("UTF-8");

	    // 폼 데이터를 가져옵니다.
	    String title = request.getParameter("groupName");
	    String content = request.getParameter("description");
	    Long writerId = ...; // 세션 또는 다른 방법으로 작성자 ID를 얻습니다.
	    Long groupId = ...; // 선택된 그룹 ID를 얻습니다.

	    // Post 객체를 생성합니다.
	    Post newPost = new Post();
	    newPost.setTitle(title);
	    newPost.setContent(content);
	    newPost.setWriter(writerId);
	    newPost.setGroupId(groupId);
	    // 기타 필요한 필드도 설정할 수 있습니다.

	    // PostDAO를 사용하여 데이터베이스에 Post 객체를 저장합니다.
	    PostDAO postDao = new PostDAO();
	    Long postId = postDao.savePost(newPost); // savePost()는 저장된 Post의 ID를 반환해야 합니다.

	    // Post의 세부 사항 페이지로 리디렉션합니다.
	    response.sendRedirect(request.getContextPath() + "/posts/" + postId);
	}

}
