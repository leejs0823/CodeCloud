package controller;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Group;

/**
 * Servlet implementation class GroupServlet
 */
@WebServlet("/groupServlet")
public class GroupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GroupServlet() {
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
		String groupName = request.getParameter("groupName");
		String description = request.getParameter("description");
		String groupImage = "";
		String groupThumbnail = "";
		
		// 이미지 관련 코드 설정해야 함
		
		Group group = new Group();
		group.setGroupName(groupName);
		group.setDescription(description);
		group.setGroupImage(groupImage);
		group.setGroupThumbnail(groupThumbnail);
		
		Connection conn = null;
		Statement stmt = null;
		String sql = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		
		// 데이터베이스 연결 및 삽입
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/grouptable?serverTimezone=UTC";
			conn = DriverManager.getConnection(url, "root", "tmdghfkd202!");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			sql = "select * from grouptable";
			rs = stmt.executeQuery(sql);
			
			ps = conn.prepareStatement("INSERT INTO grouptable (groupName, description, groupImage, groupThumbnail) VALUES (?, ?, ?, ?)");
			ps.setString(1,  group.getGroupName());
			ps.setString(2,  group.getDescription());
			ps.setString(3,  group.getGroupImage());
			ps.setString(4,  group.getGroupThumbnail());
			
			ps.executeUpdate();
			conn.close();
		}
		catch(Exception e) {
			System.out.println("DB 연동오류랑께. 이 오류랑께: " + e.getMessage());
		}
		
		request.setAttribute("registeredGroup", group);
		
		request.getRequestDispatcher("groupRegisterResult.jsp").forward(request, response);
	}

}