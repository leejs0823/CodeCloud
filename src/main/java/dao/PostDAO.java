package dao;

import model.Post;
import model.Group;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {
    // 게시물을 데이터베이스에 저장하는 메서드 - 저장 잘 됨
    public Long savePost(Post post) throws SQLException {
        String sql = "INSERT INTO Posts (writer, group_id, title, content) VALUES (?, ?, ?, ?)";
        Long postId = null;
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setLong(1, post.getWriter());
            stmt.setLong(2, 5L);
            stmt.setString(3, post.getTitle());
            stmt.setString(4, post.getContent());
            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        postId = generatedKeys.getLong(1);
                    }
                }
            }
        }
        return postId;
    }
    
    // 특정 ID의 게시물을 찾는 메서드
    public Post getPostById(int postId) throws SQLException {
        String sql = "SELECT * FROM Posts WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, postId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt("id"));
                post.setWriter(rs.getLong("writer"));
                post.setGroupId(rs.getLong("group_id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setCreatedAt(rs.getTimestamp("createdAt").toLocalDateTime());
                post.setUpdatedAt(rs.getTimestamp("updatedAt").toLocalDateTime());
                return post;
            }
        }
		return null;
   
    }
    
    // 사용자의 닉네임을 가져오는 메서드
    public String findNicknameByUserId(Long userId) throws SQLException {
        String nickname = null;
        String sql = "SELECT nickname FROM `Users` WHERE id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setLong(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                nickname = rs.getString("nickname");
            }
        }
        return nickname;
    }   
    
    // 사용자가 가입한 그룹의 목록을 가져오는 메서드
    public List<Group> getGroupsByUserId(Long userId) throws SQLException {
        List<Group> groups = new ArrayList<>();
        String sql = "SELECT g.groupId, g.groupName FROM Groups g " +
                     "INNER JOIN UserGroups ug ON g.groupId = ug.groupId " +
                     "WHERE ug.userId = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Group group = new Group();
                    group.setGroupId(rs.getLong("groupId"));
                    group.setGroupName(rs.getString("groupName"));
                    groups.add(group);
                }
            }
        }
        return groups;
    }
    
    // 사용자의 그룹 이름을 가져오는 메서드
    public String findGroupNameByGroupId(Long groupId) throws SQLException {
        String groupName = null;
        String sql = "SELECT groupName FROM `Groups` WHERE groupId = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setLong(1, groupId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                groupName = rs.getString("groupName");
            }
        }
        return groupName;
    }
    
    // 사용자가 속한 그룹의 ID를 가져오는 메서드
    public Long getGroupIdByUserId(Long userId) throws SQLException {
        Long groupId = null;
        String QUERY_GROUPID = "SELECT groupId FROM `UserGroups` WHERE userId = ?"; // 가정한 테이블 및 컬럼명

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(QUERY_GROUPID)) {
             
            preparedStatement.setLong(1, userId);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    groupId = resultSet.getLong("groupId");
                }
            }
        }
        return groupId;
    }
    
    // 그룹 리스트
    public List<Post> getAllPosts() throws SQLException {
        List<Post> allPosts = new ArrayList<>();
        String sql = "SELECT * FROM `Posts`";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt("id"));
                post.setWriter(rs.getLong("writer"));
                post.setGroupId(rs.getLong("group_id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setCreatedAt(rs.getTimestamp("createdAt").toLocalDateTime());
                post.setUpdatedAt(rs.getTimestamp("updatedt").toLocalDateTime());
                allPosts.add(post);
            }
        }
        return allPosts;
    }

}
