package dao;

import model.Post;
import model.Group;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {
    // 게시물을 데이터베이스에 저장하는 메서드
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
                // viewCnt
                post.setViewCnt(rs.getInt("viewCnt"));
                post.setLikeCnt(rs.getInt("likeCnt"));
//              post.setComments(rs.getInt("likeCnt"));
                
                // likeCnt
                
                // commentCnt
                
                return post;
            }
        }
		return null;
   
    }
    
    // 사용자의 닉네임을 가져오는 메서드
    public String findNicknameByUserId(Long userId) throws SQLException {
        String nickname = null;
        String sql = "SELECT nickname FROM Users WHERE id = ?";
        
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
    
    // POST ID로 Group Name 가져오기 
    public String findGroupNameByPostId(int postId) throws SQLException {

        String groupName = null;
        int groupId = 0; // INT로 변경

        // postId에서 groupId를 가져오는 쿼리문 추가
        String groupIdQuery = "SELECT group_id FROM Posts WHERE id = ?";
        String groupNameQuery = "SELECT groupName FROM `Groups` WHERE groupId = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement groupIdStmt = conn.prepareStatement(groupIdQuery);
             PreparedStatement groupNameStmt = conn.prepareStatement(groupNameQuery)) {

            // postId로 groupId를 가져오기 위한 쿼리 실행
            groupIdStmt.setInt(1, postId); // INT로 변경
            ResultSet groupIdResultSet = groupIdStmt.executeQuery();
            
            if (groupIdResultSet.next()) {
                groupId = groupIdResultSet.getInt("group_id"); // INT로 변경
            }
            
            // 중간 진행 상황 출력
            System.out.println("🤖 진행중 - groupId 가져오기 완료");

            if (groupId != 0) { // 0과 비교하여 NULL 검사(INT 형식에서는 NULL 대신 0 사용)
                // groupId로 groupName을 가져오기 위한 쿼리 실행
                groupNameStmt.setInt(1, groupId); // INT로 변경
                ResultSet groupNameResultSet = groupNameStmt.executeQuery();

                if (groupNameResultSet.next()) {
                    groupName = groupNameResultSet.getString("groupName");
                } else {
                    // groupName을 찾지 못한 경우
                    System.err.println("❌ groupName을 찾지 못했습니다.");
                }
            } else {
                // groupId를 찾지 못한 경우
                System.err.println("❌ groupId를 찾지 못했습니다.");
            }
            
            // 중간 진행 상황 출력
            System.out.println("🤖 진행중 - groupName 가져오기 완료");
            System.out.println(groupName);
            System.out.println("🤖 진행중 - groupName은 위 ");
        } catch (SQLException e) {
            // 데이터베이스 관련 예외 처리
            System.err.println("❌ 데이터베이스 오류: " + e.getMessage());
            throw e; // 예외를 다시 던져서 상위 호출자에게 처리를 위임
        }

        return groupName;
    }


    
 //
    
    
    
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
                post.setUpdatedAt(rs.getTimestamp("updatedAt").toLocalDateTime());
                allPosts.add(post);
            }
        }
        return allPosts;
    }
    
	// 포스트 조회수 증가 메서드
    public void addViewCnt(int postId) throws SQLException {
    	String updateSql = "UPDATE Posts SET viewCnt = COALESCE(viewCnt, 0) + 1 WHERE id = ?";
    	// viewCnt가 null로 설정되어 있어서 null일 때는 값을 즐가 못 시킴. 그래서 쿼리문을 위와 같이 작성함.
        String selectSql = "SELECT viewCnt FROM Posts WHERE id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement updateStmt = conn.prepareStatement(updateSql);
                PreparedStatement selectStmt = conn.prepareStatement(selectSql)) {

            // 조회수 증가
            updateStmt.setInt(1, postId);
            int affectedRows = updateStmt.executeUpdate();
            
            if (affectedRows > 0) {
                System.out.println("👀 조회수가 1 증가했습니다.");
                
                // 증가된 조회수 가져오기
                selectStmt.setInt(1, postId);
                try (ResultSet rs = selectStmt.executeQuery()) {
                    if (rs.next()) {
                        rs.getInt("viewCnt");
                    }
                }
            } else {
                System.err.println("❌ 조회수 증가에 실패했습니다.");
            }
        } catch (SQLException e) {
            System.err.println("❌ 데이터베이스 오류: " + e.getMessage());
            throw e;
        }
    }
    
    // toggle like 
    public boolean toggleLike(int postId, long userId) throws SQLException {
        // 사용자가 이미 좋아요를 눌렀는지 확인
        String checkSql = "SELECT EXISTS (SELECT 1 FROM UserLikes WHERE userId = ? AND postId = ?)";
        boolean isLiked;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
            checkStmt.setLong(1, userId);
            checkStmt.setLong(2, postId);
            
            ResultSet rs = checkStmt.executeQuery();
            rs.next();
            isLiked = rs.getBoolean(1);
        }

        String sql;
        if (isLiked) {
            // 이미 좋아요를 눌렀다면 좋아요 취소
            sql = "DELETE FROM Likes WHERE userId = ? AND postId = ?";
            System.err.println("❌ 조아요 삭제");
        } else {
            // 좋아요를 누르지 않았다면 추가
            sql = "INSERT INTO Likes (userId, postId) VALUES (?, ?)";
            System.err.println("조아요 추가");
        }

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, userId);
            stmt.setLong(2, postId);
            stmt.executeUpdate();
        }

        return !isLiked;
    }

    public int getLikeCnt(int postId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM Likes WHERE postId = ?";
        int likeCount = 0;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, postId);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                likeCount = rs.getInt(1);
                System.err.println("조아요 수 ");
            }
        }

        return likeCount;
    }
    public ArrayList<Post> getPostsByGroupId(Long groupId)  throws SQLException {
    	ArrayList<Post> allGroupPosts = new ArrayList<>();
        String query = "SELECT * FROM Posts WHERE group_id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
        	stmt.setLong(1,  groupId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt("id"));
                post.setWriter(rs.getLong("writer"));
                post.setGroupId(rs.getLong("group_id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setCreatedAt(rs.getTimestamp("createdAt").toLocalDateTime());
                post.setUpdatedAt(rs.getTimestamp("updatedAt").toLocalDateTime());
                allGroupPosts.add(post);
            }
        }
        return allGroupPosts;
    }
    public void updatePost(Post post) throws SQLException {
        String sql = "UPDATE Posts SET title = ?, content = ? WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, post.getTitle());
            stmt.setString(2, post.getContent());
            stmt.setInt(3, post.getId());
            stmt.executeUpdate();
        }
    }
    public void deletePost(int postId) throws SQLException {
        String sql = "DELETE FROM Posts WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, postId);
            stmt.executeUpdate();
        }
    }

}
