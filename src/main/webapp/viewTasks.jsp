<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="employee.model.Task" %>


<!DOCTYPE html>
<html>
<head>
    <title>Task Details</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h1>Task Details</h1>
    
    <c:if test="${not empty tasks}">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Project Name</th>
                    <th>Date</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Duration</th>
                    <th>Category</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="task" items="${tasks}">
                    <tr>
                        <td>${task.taskId}</td>
                        <td>${task.projectName}</td>
                        <td>${task.date}</td>
                        <td>${task.startTime}</td>
                        <td>${task.endTime}</td>
                        <td>${task.duration}</td>
                        <td>${task.taskCategory}</td>
                        <td>${task.description}</td>
                        <td>
                            <form action="editTask" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="${task.taskId}">
                                <input type="submit" value="Edit">
                            </form>
                            <form action="deleteTask" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="${task.taskId}">
                                <input type="submit" value="Delete">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    
    <c:if test="${empty tasks}">
        <p>No tasks found.</p>
    </c:if>
</body>
</html>
