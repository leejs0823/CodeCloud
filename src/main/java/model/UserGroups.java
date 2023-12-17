package model;

public class UserGroups {
	 private Long userId; // 사용자 ID
	 private Long groupId; // 그룹 ID
	 
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Long getGroupId() {
		return groupId;
	}
	public void setGroupId(Long groupId) {
		this.groupId = groupId;
	}
	 // 객체의 문자열 표현을 반환하는 toString 메소드
	 @Override
	 public String toString() {
	     return "UserGroups{" +
	             ", userId=" + userId +
	             ", groupId=" + groupId +
	             '}';
	 }
}
