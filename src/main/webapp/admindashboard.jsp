<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        
        .container {
            width: 80%;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-top: 20px;
        }
        
        header {
            background: #35424a;
            color: #ffffff;
            padding: 20px 0;
            text-align: center;
        }
        
        header h1 {
            margin: 0;
        }
        
        nav ul {
            list-style: none;
            padding: 0;
            text-align: center;
        }
        
        nav ul li {
            display: inline;
            margin: 0 10px;
        }
        
        nav ul li a {
            color: #ffffff;
            text-decoration: none;
        }
        
        main {
            padding: 20px;
        }
        
        footer {
            background: #35424a;
            color: #ffffff;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        
        form {
            display: flex;
            flex-direction: column;
            max-width: 400px;
        }
        
        form label {
            margin: 10px 0 5px;
        }
        
        form input {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        
        form button {
            padding: 10px;
            background: #35424a;
            color: #ffffff;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        
        form button:hover {
            background: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Admin Dashboard</h1>
            <nav>
                <ul>
                    <li><a href="registeruser.jsp">Register Users</a></li>
                    <li><a href="addTask.jsp">Add Task</a></li>
                    <li><a href="addProject.jsp">add projects</a></li>
                    <li><a href="Chart.jsp">View charts</a></li>
                    <li><a href="logout">Logout</a></li>
                </ul>
            </nav>
        </header>
        <main>
            <h2>Welcome, Admin</h2>
            <p>Use the navigation above to manage users, projects, and work details.</p>
        </main>
        <footer>
            <p>&copy; 2024 Employee Time Tracker. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>