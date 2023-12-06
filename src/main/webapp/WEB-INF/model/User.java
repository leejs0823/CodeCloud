package model;

import java.util.List;

public class User {
    private Long id; // 사용자의 고유 식별자
    private String email; // 사용자의 이메일 주소
    private String nickname; // 사용자의 별명
    private String description; // 사용자에 대한 설명
    private String password; // 사용자의 비밀번호
    private int groupCount; // 사용자가 속한 그룹의 수
    private List<Group> groups; // 사용자가 속한 그룹 목록
    private boolean isAdmin; // 사용자가 관리자인지 여부

    // 기본 생성자
    public User() {
    }

    // 매개변수가 있는 생성자
    public User(Long id, String email, String nickname, String description,
                String password, int groupCount, List<Group> groups, boolean isAdmin) {
        this.id = id;
        this.email = email;
        this.nickname = nickname;
        this.description = description;
        this.password = password;
        this.groupCount = groupCount;
        this.groups = groups;
        this.isAdmin = isAdmin;
    }

    // id 필드의 getter 메소드
    public Long getId() {
        return id;
    }

    // id 필드의 setter 메소드
    public void setId(Long id) {
        this.id = id;
    }

    // email 필드의 getter 메소드
    public String getEmail() {
        return email;
    }

    // email 필드의 setter 메소드
    public void setEmail(String email) {
        this.email = email;
    }

    // nickname 필드의 getter 메소드
    public String getNickname() {
        return nickname;
    }

    // nickname 필드의 setter 메소드
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    // description 필드의 getter 메소드
    public String getDescription() {
        return description;
    }

    // description 필드의 setter 메소드
    public void setDescription(String description) {
        this.description = description;
    }

    // password 필드의 getter 메소드
    public String getPassword() {
        return password;
    }

    // password 필드의 setter 메소드
    public void setPassword(String password) {
        this.password = password;
    }

    // groupCount 필드의 getter 메소드
    public int getGroupCount() {
        return groupCount;
    }

    // groupCount 필드의 setter 메소드
    public void setGroupCount(int groupCount) {
        this.groupCount = groupCount;
    }

    // groups 필드의 getter 메소드
    public List<Group> getGroups() {
        return groups;
    }

    // groups 필드의 setter 메소드
    public void setGroups(List<Group> groups) {
        this.groups = groups;
    }

    // isAdmin 필드의 getter 메소드
    public boolean isAdmin() {
        return isAdmin;
    }

    // isAdmin 필드의 setter 메소드
    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    // 객체의 문자열 표현을 반환하는 toString 메소드
    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", nickname='" + nickname + '\'' +
                ", description='" + description + '\'' +
                ", password='[PROTECTED]'" + // 비밀번호는 로깅에 나타나지 않도록 보호
                ", groupCount=" + groupCount +
                ", groups=" + groups +
                ", isAdmin=" + isAdmin +
                '}';
    }
}
