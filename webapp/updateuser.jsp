<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.DFSolutions.user.User"%>
<%@ page import="com.DFSolutions.user.UserServlet"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update User</title>
    <link rel="stylesheet" href="index.css">
    <style>
          body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background-color: rgba(200,200,200,0.7);
            backdrop-filter: blur(5px);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        form {
            display: flex;
            flex-direction: column;
            max-width: 400px;
        }
        label {
            margin-bottom: 5px;
        }
        input {
            margin-bottom: 15px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            padding: 10px;
            background-color: #2c3e50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #34495e;
        }
    </style>
</head>
<body>

<%
    String emailUpdate = request.getParameter("email");
    User user = UserServlet.getUser(emailUpdate);
%>
<div class="divboxx">
<h2>Update User Details</h2>
<form action="UserServlet" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="redirect" value="admin.jsp#user">
    <input type="hidden" name="email" value="<%= user.getEmail() %>">

    <label for="fname">First Name:</label>
    <input type="text" id="fname" name="fname" value="<%= user.getFname() %>" required>

    <label for="lname">Last Name:</label>
    <input type="text" id="lname" name="lname" value="<%= user.getLname() %>" required>

    <label for="type">User Type:</label>
    <input type="text" id="type" name="type" value="<%= user.getType() %>" required>

    <label for="mobile">Mobile:</label>
    <input type="text" id="mobile" name="mobile" value="<%= user.getMobile() %>" required>

    <label for="address">Address:</label>
    <input type="text" id="address" name="address" value="<%= user.getAddress() %>" required>

    <button type="submit" onclick="return confirm('Do you want to update the user details?')">Update</button>
    <br>
    <button onclick="window.location.href='admin.jsp'">Back to Admin Panel</button>
</form>
</div>
</body>
</html>
