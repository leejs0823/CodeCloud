package model;

import java.time.LocalDateTime;
import java.util.List;

// 게시글(Post) 정보를 나타내는 클래스
public class Post {
    private Long id; // 게시글 ID
    private Long writer; // 작성자 ID
    private Long groupId; // 그룹 ID
    private String title; // 게시글 제목
    private String content; // 게시글 내용
    private LocalDateTime createdAt; // 생성 시간
    private LocalDateTime updatedAt; // 수정 시간
    private int viewCnt; // 조회수
    private int likeCnt; // 좋아요 수
    private int commentCnt; // 댓글 수 
    private List<Comment> comments; // 게시글에 달린 댓글 리스트


    // 기본 생성자
    public Post() {
    }

    // 매개변수가 있는 생성자
    public Post(Long id, Long writer, Long groupId, String title, String content, 
                LocalDateTime createdAt, LocalDateTime updatedAt, 
                int viewCnt, int likeCnt, int commentCnt, List<Comment> comments) {
        this.id = id;
        this.writer = writer;
        this.groupId = groupId;
        this.title = title;
        this.content = content;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.viewCnt = viewCnt;
        this.likeCnt = likeCnt;
        this.commentCnt = commentCnt;
        this.comments = comments;
    }


    // 게터 셋터 
    // 댓글 리스트에 대한 게터 메서드
    public List<Comment> getComments() {
        return comments;
    }

    // 댓글 리스트에 대한 세터 메서드
    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
    
    	// 출력 
    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", writer=" + writer +
                ", groupId=" + groupId +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                ", viewCnt=" + viewCnt +
                ", likeCnt=" + likeCnt +
                ", commentCnt=" + commentCnt +
                '}';
    }
}
