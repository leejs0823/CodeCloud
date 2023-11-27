package model;
import java.time.LocalDateTime;

// 댓글(Comment) 정보를 나타내는 클래스
public class Comment {
    private Long id; // 댓글 ID
    private Long postId; // 게시글 ID
    private Long writer; // 작성자 ID
    private LocalDateTime createdAt; // 생성 시간
    private LocalDateTime updatedAt; // 수정 시간
    private String content; // 댓글 내용

    // 기본 생성자
    public Comment() {
    }

    // 매개변수가 있는 생성자
    public Comment(Long id, Long postId, Long writer, LocalDateTime createdAt, 
                   LocalDateTime updatedAt, String content) {
        this.id = id;
        this.postId = postId;
        this.writer = writer;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.content = content;
    }

    // 게터 및 세터 메서드들...
    // 생략된 게터 및 세터 메서드들은 필드에 따라 생성됩니다.

    // toString 메서드는 객체를 문자열로 표현하여 출력하기 위해 사용됩니다.
    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", postId=" + postId +
                ", writer=" + writer +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                ", content='" + content + '\'' +
                '}';
    }
}