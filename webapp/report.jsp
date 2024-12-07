<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.DFSolutions.report.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <Link rel="stylesheet" type="text/css" href="index.css">
    <title>Report Management</title>
</head>
<body>

	<div class="divbox">
	    <h1>Drive Fuel Solutions Service Center - Report Management</h1>
	    <br><br><br>
    <!-- Form to add a report -->
    <form action="ReportServlet" method="post">
        <input type="hidden" name="action" value="create">
        <input type="hidden" name="redirect" value="report.jsp">
        <label for="text">Report Title:</label>
        <input type="text" id="text" name="text" required><br><br>
        
        <label for="description">Description:</label>
        <textarea id="description" name="description" required></textarea><br><br>
        
        <label for="date">Date:</label>
        <input type="date" id="date" name="date" required><br><br>
        
        <label for="type">Type:</label>
        <input type="text" id="type" name="type" required><br><br>
        
        <label for="frequency">Frequency:</label>
        <input type="text" id="frequency" name="frequency" required><br><br>
        
        <button type="submit" >Add Report</button>
    </form>
	<br><br><br>
	<div class="container">
    <h2>Existing Reports</h2>
    <table class="tablex">
        <tr>
            <th>ID</th>
            <th>Text</th>
            <th>Description</th>
            <th>Date</th>
            <th>Type</th>
            <th>Frequency</th>
            <th>Actions</th>
        </tr>
        <%
            List<Report> reports = ReportServlet.getAllReports();
            for (Report report : reports) {
        %>
        <tr>
            <td><%= report.getReportID() %></td>
            <td><%= report.getText() %></td>
            <td><%= report.getDescription() %></td>
            <td><%= report.getDate() %></td>
            <td><%= report.getType() %></td>
            <td><%= report.getFrequency() %></td>
            <td>
				<button onclick="location.href='reportEdit.jsp?reportid=<%= report.getReportID() %>';">Edit</button> 
                <form action="ReportServlet" method="post" style="display:inline;">
                	<input type="hidden" name="redirect" value="report.jsp">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="reportid" value="<%= report.getReportID() %>">
					<button type="submit" >Delete</button>
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    </div>
    	</div>
</body>
</html>
