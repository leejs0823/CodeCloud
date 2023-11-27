package model;


//Group 클래스는 그룹의 정보를 나타냄 
public class Group {
 private Long groupId; // 그룹의 고유 식별자
 private String groupName; // 그룹 이름
 private String description; // 그룹 설명
 private String groupImage; // 그룹 이미지의 경로 또는 URL을 가정한 문자열

 // 기본 생성자
 public Group() {
 }

 // 매개변수가 있는 생성자
 public Group(Long groupId, String groupName, String description, String groupImage) {
     this.groupId = groupId;
     this.groupName = groupName;
     this.description = description;
     this.groupImage = groupImage;
 }

 // groupId 필드의 getter 메소드
 public Long getGroupId() {
     return groupId;
 }

 // groupId 필드의 setter 메소드
 public void setGroupId(Long groupId) {
     this.groupId = groupId;
 }

 // groupName 필드의 getter 메소드
 public String getGroupName() {
     return groupName;
 }

 // groupName 필드의 setter 메소드
 public void setGroupName(String groupName) {
     this.groupName = groupName;
 }

 // description 필드의 getter 메소드
 public String getDescription() {
     return description;
 }

 // description 필드의 setter 메소드
 public void setDescription(String description) {
     this.description = description;
 }

 // groupImage 필드의 getter 메소드
 public String getGroupImage() {
     return groupImage;
 }

 // groupImage 필드의 setter 메소드
 public void setGroupImage(String groupImage) {
     this.groupImage = groupImage;
 }

 // 객체의 문자열 표현을 반환하는 toString 메소드
 @Override
 public String toString() {
     return "Group{" +
             "groupId=" + groupId +
             ", groupName='" + groupName + '\'' +
             ", description='" + description + '\'' +
             ", groupImage='" + groupImage + '\'' +
             '}';
 }
}
