package controller.Group;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import model.Group;

@WebServlet("/registrationsuccess")
public class GroupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GroupServlet() {
        super();
    }
    
    private Long saveGroupToDatabase(Group group) {
        Long generatedId = null;
        String sql = "INSERT INTO `Groups` (groupName, description) VALUES (?, ?)";

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://db-jv9ds-kr.vpc-pub-cdb.ntruss.com:3306/codecloud", "staff", "codecloud@2023");
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, group.getGroupName());
            pstmt.setString(2, group.getDescription());

            int affectedRows = pstmt.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        generatedId = generatedKeys.getLong(1);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return generatedId;
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
	    request.setCharacterEncoding("UTF-8");
	    String groupName = request.getParameter("groupName");
	    String description = request.getParameter("description");

	    if (!groupNameExists(groupName)) {
	        Group group = new Group();
	        group.setGroupName(groupName);
	        group.setDescription(description);

	        Long groupId = saveGroupToDatabase(group); // DB에 저장하고 생성된 ID를 반환받음
	        if (groupId != null) {
	            group.setGroupId(groupId); // 생성된 ID를 group 객체에 설정
	            request.setAttribute("registeredGroup", group);
	            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/group/groupRegisterResult.jsp");
	            dispatcher.forward(request, response);
	        } else {
	            // 데이터베이스 저장 실패 처리
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "데이터베이스 저장 실패");
	        }
	    } else {
	        // 그룹 이름이 이미 존재하는 경우 처리
	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "이미 존재하는 그룹 이름입니다.");
	    }
	}
    
	// 사용자가 입력한 groupName이 이미 존재하는 groupName인지 확인하는 함수
    private boolean groupNameExists(String groupName) {
        boolean exists = false;
        String sql = "SELECT COUNT(*) FROM `Groups` WHERE groupName = ?";

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://db-jv9ds-kr.vpc-pub-cdb.ntruss.com:3306/codecloud", "staff", "codecloud@2023");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, groupName);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    exists = rs.getInt(1) > 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exists;
    }


}
