<%@page import="com.DFSolutions.Spart.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Spart</title>
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
<div class="divboxx">
    <h2>Update Spart</h2>

    <%
        String spartId = request.getParameter("id");
        SPart spart = SPartServlet.getPartbyid(spartId);
    %>

    <form action="PartServlet" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= spart.getId() %>">
        <input type="hidden" name="redirect" value="admin.jsp#spart">

        <label for="name">Spart Name:</label>
        <input type="text" id="name" name="name" value="<%= spart.getName() %>" required>

        <label for="type">Spart Type:</label>
        <input type="text" id="type" name="type" value="<%= spart.getType() %>" required>

        <label for="price">Price:</label>
        <input type="number" step="50" id="price" name="price" value="<%= spart.getPrice() %>" required>

        <button type="submit">Update Spart</button>
    </form>
</div>
</body>
</html>
