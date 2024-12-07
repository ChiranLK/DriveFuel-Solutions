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
<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }
    table, th, td {
        border: 1px solid black;
    }
    th, td {
        padding: 10px;
        text-align: center;
    }
    form {
        margin: 20px 0;
    }
    form input[type="text"], form input[type="email"] {
        padding: 5px;
    }
</style>
</head>
<body>
<h1>User Management - Admin</h1>

<!-- Form to Create New User -->
<h2>Create New User</h2>
<form action="UserServlet" method="post">
    <input type="hidden" name="action" value="create">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required>
    <label for="email">Email:</label>
    <input type="text" id="email" name="email" required>
    <label for="type">Type:</label>
    <input type="text" id="type" name="type" required>
    <label for="hash">Password:</label>
    <input type="password" id="hash" name="hash" required>
    <button type="submit">Create User</button>
</form>

<!-- Table to Display Users -->
<h2>Users List</h2>
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Hash</th>
            <th>Type</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <%
        // Fetch user list from UserDAO (you need to implement this class)
			List<User> UserList = new ArrayList<User>();
        	UserList = UserServlet.getAllUsers();
            for (User user : UserList) {
        %>
        <tr>
            <td><%= user.getFname() + " " + user.getLname() %></td>
			<td><%= user.getHash() %></td>
            <td><%= user.getType() %></td>
            <td><%= user.getEmail() %></td>
            <td>
            	<button onclick=location.href='updateuser.jsp?email=<%= user.getEmail() %>'>Update</button>
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

</body>
</html>
