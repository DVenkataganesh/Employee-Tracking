package employee.dao;

import employee.model.Task;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskDAO {

    private static final String URL = "jdbc:mysql://localhost:3306/EM";
    private static final String USER = "root";
    private static final String PASSWORD = "1682";

    // Method to get tasks for a specific user by username
    public List<Task> getTasksByUsername(String username) {
        List<Task> tasks = new ArrayList<>();

        // SQL query to select tasks based on the username
        String sql = "SELECT task_id, username, project_name, date, " +
                     "start_time, end_time, duration, task_category, description " +
                     "FROM tasks " +
                     "WHERE username = ?";

        // Establish a connection and execute the query
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // Set the prepared statement parameter for username
            preparedStatement.setString(1, username);

            // Execute the query and process the result set
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                // Create a Task object and set its properties from the result set
                Task task = new Task();
                task.setTaskId(resultSet.getInt("task_id"));
                task.setUsername(resultSet.getString("username"));
                task.setProjectName(resultSet.getString("project_name"));
                task.setDate(resultSet.getDate("date").toString());
                task.setStartTime(resultSet.getTime("start_time").toString());
                task.setEndTime(resultSet.getTime("end_time").toString());
                task.setDuration(resultSet.getDouble("duration"));
                task.setTaskCategory(resultSet.getString("task_category"));
                task.setDescription(resultSet.getString("description"));

                // Add the task to the list
                tasks.add(task);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Return the list of tasks
        return tasks;
    }

    // Method to add a new task
    public boolean addTask(Task task) {
        String sql = "INSERT INTO tasks (username project_name, date, start_time, end_time, duration, task_category, description) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, task.getUserId());
            preparedStatement.setInt(2, task.getProjectId());
            preparedStatement.setDate(3, Date.valueOf(task.getDate()));
            preparedStatement.setTime(4, Time.valueOf(task.getStartTime()));
            preparedStatement.setTime(5, Time.valueOf(task.getEndTime()));
            preparedStatement.setDouble(6, task.getDuration());
            preparedStatement.setString(7, task.getTaskCategory());
            preparedStatement.setString(8, task.getDescription());

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Method to update an existing task
    public boolean updateTask(Task task) {
        String sql = "UPDATE tasks SET project_name = ?, date = ?, start_time = ?, end_time = ?, duration = ?, task_category = ?, description = ? " +
                     "WHERE task_id = ?";

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, task.getProjectId());
            preparedStatement.setDate(2, Date.valueOf(task.getDate()));
            preparedStatement.setTime(3, Time.valueOf(task.getStartTime()));
            preparedStatement.setTime(4, Time.valueOf(task.getEndTime()));
            preparedStatement.setDouble(5, task.getDuration());
            preparedStatement.setString(6, task.getTaskCategory());
            preparedStatement.setString(7, task.getDescription());
            preparedStatement.setInt(8, task.getTaskId());

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Method to delete a task by taskId
    public boolean deleteTask(int taskId) {
        String sql = "DELETE FROM tasks WHERE task_id = ?";

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, taskId);

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

	public Task getTaskById(int taskId) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean updateTask(int taskId, String projectName, String date, String startTime, String endTime,
			double duration, String taskCategory, String description) {
		// TODO Auto-generated method stub
		return false;
	}
}
