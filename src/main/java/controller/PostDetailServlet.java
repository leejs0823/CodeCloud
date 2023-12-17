package controller;

import dao.PostDAO;
import model.Post;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
@WebServlet("/postDetail")
public class PostDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // postId 파라미터를 가져옵니다.
        String postIdParam = request.getParameter("postId");
        
        // postId가 null이면 오류 처리
        if (postIdParam == null || postIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "postId 파라미터가 필요합니다.");
            return;
        }

        try {
            int postId = Integer.parseInt(postIdParam);

            // PostDAO를 사용하여 postId에 해당하는 게시물을 가져옵니다.
            PostDAO postDAO = new PostDAO();
            Post post = postDAO.getPostById(postId);

            if (post != null) {
                // 게시물을 request 속성에 설정하여 postDetail.jsp로 전달
                request.setAttribute("post", post);
                
                // 여기서 게시물 목록을 불러옵니다.
                List<Post> allPosts = postDAO.getAllPosts(); // PostDAO에서 getAllPosts 메서드를 작성해야 합니다.
                request.setAttribute("allPosts", allPosts);
                
                request.getRequestDispatcher("/CodeCloud/views/post/postDetail.jsp").forward(request, response);
            } else {
                // postId에 해당하는 게시물을 찾지 못한 경우 오류 처리
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "게시물을 찾을 수 없습니다.");
            }
        } catch (NumberFormatException e) {
            // postId를 Long으로 변환할 때 예외 처리
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "올바른 postId를 입력하세요.");
        } catch (SQLException e) {
            // 데이터베이스 오류 처리
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "데이터베이스 오류가 발생했습니다.");
        }
    }
}
