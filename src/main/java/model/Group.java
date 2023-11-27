package model;


// Group Class
public class Group {
    private Long groupId;
    private String groupName;
    private String description;
    private String groupImage; // Assuming the image is stored as a path or URL string

    // Default constructor
    public Group() {
    }

    // Parameterized constructor
    public Group(Long groupId, String groupName, String description, String groupImage) {
        this.groupId = groupId;
        this.groupName = groupName;
        this.description = description;
        this.groupImage = groupImage;
    }

    // Getters and setters
    public Long getGroupId() {
        return groupId;
    }

    public void setGroupId(Long groupId) {
        this.groupId = groupId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getGroupImage() {
        return groupImage;
    }

    public void setGroupImage(String groupImage) {
        this.groupImage = groupImage;
    }

    // toString method for easy printing and debugging
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
