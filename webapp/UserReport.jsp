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
	<%@ include file="components/header.jsp" %>
	<div class="divbox">
	    <h1>Drive Fuel Solutions Service Center - Reports</h1>
	    <br><br><br>
    <!-- Form to add a report -->
	<br><br><br>
	<div class="container">
    <table class="tablex">
        <tr>
            <th>ID</th>
            <th>Text</th>
            <th>Description</th>
            <th>Date</th>
            <th>Type</th>
            <th>Frequency</th>
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

        </tr>
        <%
            }
        %>
    </table>
    </div>
    	</div>
</body>
</html>
