<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.DFSolutions.report.Report"%>
<%@ page import="com.DFSolutions.report.ReportServlet"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Report</title>
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
    String reportIdUpdate = request.getParameter("id");
    Report report = ReportServlet.getReport(reportIdUpdate);
%>
<div class="divboxx">
<h2>Update Report Details</h2>
<form action="ReportServlet" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="redirect" value="admin.jsp#report">
    <input type="hidden" name="reportid" value="<%= report.getReportID() %>">

    <label for="text">Report Text:</label>
    <input type="text" id="text" name="text" value="<%= report.getText() %>" required>

    <label for="description">Description:</label>
    <input type="text" id="description" name="description" value="<%= report.getDescription() %>" required>

    <label for="date">Date:</label>
    <input type="date" id="date" name="date" value="<%= report.getDate() %>" required>

    <label for="type">Type:</label>
    <input type="text" id="type" name="type" value="<%= report.getType() %>" required>

    <label for="frequency">Frequency:</label>
    <input type="text" id="frequency" name="frequency" value="<%= report.getFrequency() %>" required>

    <button type="submit" onclick="return confirm('Do you want to update the report details?')">Update</button>
    <br>
    <button onclick="window.location.href='admin.jsp'">Back to Admin Panel</button>
</form>
</div>
</body>
</html>
