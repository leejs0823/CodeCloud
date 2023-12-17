package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Group;

public class GroupDAO {
	
	public Group getGroupById(Long groupId) {
		
		String query = "SELECT * FROM codecloud.Groups WHERE groupId = ?";
		
        try(Connection conn = DatabaseConnection.getConnection();
        		PreparedStatement stmt = conn.prepareStatement(query);) {
        	
        	stmt.setLong(1, groupId);
        	
        	ResultSet rs = stmt.executeQuery();
        	
        	if(rs.next()) {
        		Group findgroup = new Group();
                findgroup.setGroupId(rs.getLong("groupId"));
                findgroup.setGroupName(rs.getString("groupName"));
                findgroup.setDescription(rs.getString("description"));
                return findgroup;
        	}
        }catch (SQLException e) {
            // 예외 처리
            e.printStackTrace();
        }
        return null;
	}

	public void updateGroup(Group group) {
        // 그룹을 업데이트하는 메서드
       
		String query = "UPDATE codecloud.Groups SET groupName = ?, description = ? WHERE groupId = ?";
        try(Connection conn = DatabaseConnection.getConnection();
        		PreparedStatement stmt = conn.prepareStatement(query);) {

            // 쿼리 매개변수 설정
        	
            stmt.setString(1, (String)group.getGroupName());
            stmt.setString(2, (String)group.getDescription());
            stmt.setLong(3, (Long)group.getGroupId());
            // 쿼리 실행
            stmt.executeUpdate();

        } catch (SQLException e) {
            // 예외 처리
            e.printStackTrace();
        } 
    }
}