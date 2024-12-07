<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession Xsession = request.getSession(false); // Get session without creating a new one
    if (Xsession == null || Xsession.getAttribute("username") == null) {
        // If there's no session or no user attribute, redirect to login page
        response.sendRedirect("login.jsp");
    }
%>

<html>
<head>
    <title>Dashboard</title>
</head>
<body>
    <h2>Welcome, <%= Xsession.getAttribute("username") %>!</h2>
    <a> User Type :- <%= Xsession.getAttribute("type") %> </a>
    <a href="LogoutServlet">Logout</a>
</body>
</html>