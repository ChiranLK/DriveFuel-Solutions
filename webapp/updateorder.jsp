<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.DFSolutions.orders.Order"%>
<%@ page import="com.DFSolutions.orders.OrderServlet"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Order</title>
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
    String id = request.getParameter("id");
    Order order = OrderServlet.getOder(id);
%>
<div class="divboxx">
<h2>Update Order Details</h2>
<form action="OrderServlet" method="post">
    <input type="hidden" name="action" value="updateadmin">
    <input type="hidden" name="redirect" value="admin.jsp">
    <input type="hidden" name="email" value="<%= order.getEmail() %>">
	<input type="hidden" name="id" value="<%= order.getId() %>">
    <label for="unitprice">Unit Price:</label>
    <input type="text" id="unitprice" name="unitprice" value="<%= order.getUnitprice() %>" required>

    <label for="item">Item:</label>
    <input type="text" id="item" name="item" value="<%= order.getItem() %>" required>

    <label for="quantity">Quantity:</label>
    <input type="number" id="quantity" name="quantity" value="<%= order.getQuantity() %>" required>

    <label for="totalprice">Total Price:</label>
    <input type="text" id="totalprice" name="totalprice" value="<%= order.getTotalprice() %>" required>

    <label for="status">Status:</label>
    <input type="text" id="status" name="status" value="<%= order.getStatus() %>" required>

    <label for="type">Type:</label>
    <input type="text" id="type" name="type" value="<%= order.getType() %>" required>

    <button type="submit" onclick="return confirm('Do you want to update the order details?')">Update</button>
    <br>
    <button onclick="window.location.href='admin.jsp'">Back to Admin Panel</button>
</form>
</div>
</body>
</html>