package employee.model;

public class Task {
    private int taskId;
    private int userId;
    private int projectId;
    private String projectName;
    private String date;
    private String startTime;
    private String endTime;
    private double duration;
    private String taskCategory;
    private String description;

    public Task() {
		// TODO Auto-generated constructor stub
	}
	// Getter and Setter for taskId
    public int getTaskId() {
        return taskId;
    }
    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    // Getter and Setter for userId
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }

    // Getter and Setter for projectId
    public int getProjectId() {
        return projectId;
    }
    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    // Getter and Setter for projectName
    public String getProjectName() {
        return projectName;
    }
    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    // Getter and Setter for date
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }

    // Getter and Setter for startTime
    public String getStartTime() {
        return startTime;
    }
    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    // Getter and Setter for endTime
    public String getEndTime() {
        return endTime;
    }
    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    // Getter and Setter for duration
    public double getDuration() {
        return duration;
    }
    public void setDuration(double duration) {
        this.duration = duration;
    }

    // Getter and Setter for taskCategory
    public String getTaskCategory() {
        return taskCategory;
    }
    public void setTaskCategory(String taskCategory) {
        this.taskCategory = taskCategory;
    }

    // Getter and Setter for description
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
	public void setUsername(String string) {
		// TODO Auto-generated method stub
		
	}
}
