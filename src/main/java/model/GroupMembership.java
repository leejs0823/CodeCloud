package model;

import java.time.LocalDateTime;

//그룹 멤버십 클래스는 그룹 내의 사용자 멤버십에 대한 정보를 담고 있
public class GroupMembership {
 private Long membershipId; // 멤버십 ID
 private Long userId; // 사용자 ID
 private Long groupId; // 그룹 ID
 private Role role; // 멤버십 역할 (멤버 혹은 리더)
 private LocalDateTime joinDate; // 가입 날짜

 // 사용자 역할을 정의하는 열거형 (MEMBER: 멤버, LEADER: 리더)
 public enum Role {
     MEMBER, LEADER
 }

 // 기본 생성자
 public GroupMembership() {
 }

 // 매개변수가 있는 생성자
 public GroupMembership(Long membershipId, Long userId, Long groupId, Role role, LocalDateTime joinDate) {
     this.membershipId = membershipId;
     this.userId = userId;
     this.groupId = groupId;
     this.role = role;
     this.joinDate = joinDate;
 }

 // membershipId 필드의 getter 메소드
 public Long getMembershipId() {
     return membershipId;
 }

 // membershipId 필드의 setter 메소드
 public void setMembershipId(Long membershipId) {
     this.membershipId = membershipId;
 }

 // userId 필드의 getter 메소드
 public Long getUserId() {
     return userId;
 }

 // userId 필드의 setter 메소드
 public void setUserId(Long userId) {
     this.userId = userId;
 }

 // groupId 필드의 getter 메소드
 public Long getGroupId() {
     return groupId;
 }

 // groupId 필드의 setter 메소드
 public void setGroupId(Long groupId) {
     this.groupId = groupId;
 }

 // role 필드의 getter 메소드
 public Role getRole() {
     return role;
 }

 // role 필드의 setter 메소드
 public void setRole(Role role) {
     this.role = role;
 }

 // joinDate 필드의 getter 메소드
 public LocalDateTime getJoinDate() {
     return joinDate;
 }

 // joinDate 필드의 setter 메소드
 public void setJoinDate(LocalDateTime joinDate) {
     this.joinDate = joinDate;
 }

 // 객체의 문자열 표현을 반환하는 toString 메소드
 @Override
 public String toString() {
     return "GroupMembership{" +
             "membershipId=" + membershipId +
             ", userId=" + userId +
             ", groupId=" + groupId +
             ", role=" + role +
             ", joinDate=" + joinDate +
             '}';
 }
}
