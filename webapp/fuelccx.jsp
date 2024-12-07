<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.DFSolutions.fuel.*, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fuel Management</title>
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
<h1>Fuel Management - Admin</h1>

<!-- Form to Create New Fuel -->
<h2>Create New Fuel</h2>
<form action="FuelServlet" method="post">
    <input type="hidden" name="action" value="create">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required>
    <input type="text" id="type" name="type" required>  
 	<input type="text" id="price" name="price" required>   
    <button type="submit">Create Fuel</button>
</form>

<!-- Table to Display Fuel -->
<h2>Fuel List</h2>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Type</th>
            <th>Price</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <%
            // Fetch fuel list from FuelDAO (you need to implement this class)
			List<Fuel> FuelList = new ArrayList<Fuel>();
        	FuelList = FuelServlet.getAllFuel();
            for (Fuel fuel : FuelList) {
        %>
        <tr>
            <td><%= fuel.getId() %></td>
            <td><%= fuel.getName() %></td>
            <td><%= fuel.getType() %></td>
            <td><%= fuel.getPrice() %></td>
            <td>
            	<button onclick=location.href='updatefuel.jsp?id=<%= fuel.getId() %>'>Update</button>
                <!-- Form to Delete Fuel -->
                <form action="FuelServlet" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= fuel.getId() %>">
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
