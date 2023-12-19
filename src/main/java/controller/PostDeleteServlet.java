package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PostDAO;

/**
 * Servlet implementation class PostDeleteServlet
 */
@SuppressWarnings("serial")
@WebServlet("/deletePost")
public class PostDeleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        int postId = Integer.parseInt(request.getParameter("postId"));
        PostDAO postDAO = new PostDAO();

        try {
            postDAO.deletePost(postId);
            response.sendRedirect("index.jsp"); // 게시물 목록 페이지나 홈으로 리디렉션
        } catch (Exception e) {
            e.printStackTrace();
            // 오류 처리 페이지로 리디렉션
        }
    }
}