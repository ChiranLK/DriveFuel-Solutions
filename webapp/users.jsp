<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.DFSolutions.user.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Management</title>
<link rel="stylesheet" type="text/css" href="index.css"> <!-- Link to external CSS -->
</head>
<body>

<div class="divbox">
<h1>User Management - Admin</h1>

<!-- Form to Create New User -->
<h2>Create New User</h2>
<form action="UserServlet" method="post">
    <input type="hidden" name="action" value="create">
    <input type="hidden" name="redirect" value=<%=request.getRequestURI()%>>>
    <label for="name">First Name:</label>
    <input type="text" id="name" name="name" required>
    
    <label for="lname">Last Name:</label>
    <input type="text" id="lname" name="lname" required>
    
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required>
    
    <label for="hash">Password:</label>
    <input type="password" id="hash" name="hash" required>
    
    <label for="type">User Type:</label>
    <input type="text" id="type" name="type" required>
    
    <label for="address">Address:</label>
    <input type="text" id="address" name="address" required>
    
    <label for="mobile">Mobile:</label>
    <input type="text" id="mobile" name="mobile" required>    
    <button type="submit">Create User</button>
</form>
</div>
<!-- Table to Display Users -->
<div class="divbox">
<h2>Users List</h2>
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Type</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <%
        // Fetch user list from UserDAO (you need to implement this class)
        List<User> userList = UserServlet.getAllUsers();
        for (User user : userList) {
        %>
        <tr>
            <td><%= user.getFname() + " " + user.getLname() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getType() %></td>
            <td>
                <button onclick="location.href='updateuser.jsp?id=<%= user.getEmail() %>'">Update</button>
                <!-- Form to Delete User -->
                <form action="UserServlet" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= user.getEmail() %>">
                    <button type="submit" onclick="return confirm('Are you sure?')">Delete</button>
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
</div>
</body>
</html>
