<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*, java.text.SimpleDateFormat" %>
<%@ page import="com.DFSolutions.user.*, com.DFSolutions.payment.*" %>
<%
    // Retrieve the user from session
    User userx = (User) request.getSession().getAttribute("user");
	List<Payment> paymentlist = PaymentServlet.getAllPayments();
	Payment payment = paymentlist.getLast();
    // Redirect if the user is not logged in

	%>
<html>
	<head>
<link rel="stylesheet" href="index.css">
	</head>
	<body>
		<div class="divbox">
	   <h1>Payment Successful!</h1>
	   <h2>Your Payment Details:</h2>
	 	<ul>
	       <li>Payment ID: <%= payment.getId() %></li>
	       <li>Email: <%= payment.getEmail() %></li>
	       <li>Amount: Rs. <%= payment.getAmount() %></li>
	       <li>Status: <%= payment.getStatus() %></li>
	       <li>Payment Method: <%= payment.getPaymentMethod() %></li>
	       <li>Payment Date: <%= payment.getPaymentDate() %></li>
		</ul>
		
		<br>
		<button onclick="location.href='index.jsp'">Back To Home</button>
		</div>
		
	</body>
</html>
l>