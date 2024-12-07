<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.DFSolutions.fuel.Fuel"%>
<%@ page import="com.DFSolutions.fuel.FuelServlet"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Fuel</title>
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
    String usedIdUpdate = request.getParameter("id");
    Fuel fuel = FuelServlet.getFuelbyID(Integer.parseInt(usedIdUpdate));
%>
<div class="divboxx">
<h2>Update Fuel Details</h2>
<form action="FuelServlet" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="redirect" value="admin.jsp">
    <input type="hidden" name="id" value="<%= fuel.getId() %>">

    <label for="name">Fuel Name:</label>
    <input type="text" id="name" name="name" value="<%= fuel.getName() %>" required>

    <label for="type">Fuel Type:</label>
    <input type="text" id="type" name="type" value="<%= fuel.getType() %>" required>

    <label for="price">Price:</label>
    <input type="number" id="price" name="price" step="50" value="<%= fuel.getPrice() %>" required>

    <button type="submit" onclick="return confirm('Do you want to update the fuel details?')">Update</button>
    <br>
    <button onclick="window.location.href='admin.jsp'">Back to Admin Panel</button>
</form>
</div>
</body>
</html>
