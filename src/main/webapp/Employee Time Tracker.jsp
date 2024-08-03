<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Time Tracker</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Employee Time Tracker</h1>
        </header>

        <section class="task-form">
            <h2>Add Task</h2>
            <form id="taskForm">
                <label for="date">Date:</label>
                <input type="date" id="date" name="date" required>
                
                <label for="start_time">Start Time:</label>
                <input type="time" id="start_time" name="start_time" required>
                
                <label for="end_time">End Time:</label>
                <input type="time" id="end_time" name="end_time" required>
                
                <label for="category">Category:</label>
                <input type="text" id="category" name="category" required>
                
                <label for="description">Description:</label>
                <input type="text" id="description" name="description" required>
                
                <label for="duration">Duration (hours):</label>
                <input type="number" id="duration" name="duration" required>
                
                <button type="submit">Add Task</button>
            </form>
        </section>

        <section class="task-list">
            <h2>Task List</h2>
            <table>
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Start Time</th>
                        <th>End Time</th>
                        <th>Category</th>
                        <th>Description</th>
                        <th>Duration</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="taskList">
                    <!-- Task items will be populated here -->
                </tbody>
            </table>
        </section>
    </div>

    <script src="scripts.js"></script>
</body>
</html>