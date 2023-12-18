package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Group;
import model.GroupMembership;
import model.User;
import java.util.List;
import java.util.ArrayList;


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
            e.printStackTrace();
        }
        return null;
	}

	public void updateGroup(Group group) {
       
		String query = "UPDATE codecloud.Groups SET groupName = ?, description = ? WHERE groupId = ?";
        try(Connection conn = DatabaseConnection.getConnection();
        		PreparedStatement stmt = conn.prepareStatement(query);) {

        	
            stmt.setString(1, (String)group.getGroupName());
            stmt.setString(2, (String)group.getDescription());
            stmt.setLong(3, (Long)group.getGroupId());

            stmt.executeUpdate();

        } catch (SQLException e) {

            e.printStackTrace();
        } 
    }
	
	public Long getLeaderId(Long groupId) {
		String query = "SELECT * FROM codecloud.GroupMemberships WHERE groupId = ? AND role = 'leader'";
		try(Connection conn = DatabaseConnection.getConnection();
        		PreparedStatement stmt = conn.prepareStatement(query);) {

			stmt.setLong(1, groupId);
        	
        	ResultSet rs = stmt.executeQuery();
        	
        	if(rs.next()) {
                return rs.getLong("userId");
        	}
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
	}

	public String getUserById(Long userId) {
        
		String query = "SELECT * FROM codecloud.Users WHERE id = ?";

        try(Connection conn = DatabaseConnection.getConnection();
        		PreparedStatement stmt = conn.prepareStatement(query);) {

            stmt.setLong(1, userId);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getString("nickname");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return null;
    }
	
	public Long[] getUsersByGroupId(Long groupId) {
		Long[] userIds = null;
		String query1 = "SELECT COUNT(userId) FROM codecloud.GroupMemberships WHERE groupId = ? AND role = 'member'";
		try(Connection conn = DatabaseConnection.getConnection();
        		PreparedStatement stmt = conn.prepareStatement(query1);) {

            stmt.setLong(1, groupId);

            ResultSet rs = stmt.executeQuery();

            int rowCount = 0;
            if (rs.next()) {
                rowCount = rs.getInt(1);
            }
            userIds = new Long[rowCount];
            
        } catch (SQLException e) {
            e.printStackTrace();
        } 
		String query2 = "SELECT userId FROM codecloud.GroupMemberships WHERE groupId = ? AND role = 'member'";
		try(Connection conn = DatabaseConnection.getConnection();
        		PreparedStatement stmt = conn.prepareStatement(query2);) {

            stmt.setLong(1, groupId);

            ResultSet rs = stmt.executeQuery();

            int i = 0;
            while(rs.next()) {
            	userIds[i] = rs.getLong("userId");
            	i++;
            }
            return userIds;
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return null;
	}
	
	public ArrayList<Group> getAllGroups() throws SQLException{
		ArrayList<Group> allGroups = new ArrayList<>();
		
		String query = "SELECT * FROM codecloud.Groups'";
		try(Connection conn = DatabaseConnection.getConnection();
        		PreparedStatement stmt = conn.prepareStatement(query);) {

            ResultSet rs = stmt.executeQuery();

            while(rs.next()) {
            	Group group = new Group();
            	group.setGroupId(rs.getLong("groupId"));
            	group.setGroupName(rs.getString("groupName"));
            	group.setDescription(rs.getString("description"));
            	allGroups.add(group);
            }
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        return allGroups;
	}
	
	public int countGroupUsers(Long groupId) throws SQLException{
		int count = 0;
		String query = "SELECT COUNT(*) FROM codecloud.GroupMemberships WHERE groupId = ?";
		try(Connection conn = DatabaseConnection.getConnection();
        		PreparedStatement stmt = conn.prepareStatement(query);) {

            stmt.setLong(1, groupId);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }
            
        } 
		return count;
	}
}