<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.DFSolutions.payment.Payment"%>
<%@ page import="com.DFSolutions.payment.PaymentServlet"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Payment</title>
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
    String paymentIdUpdate = request.getParameter("id");
    Payment payment = PaymentServlet.getPayment(Integer.parseInt(paymentIdUpdate));
%>
<div class="divboxx">
<h2>Update Payment Details</h2>
<form action="PaymentServlet" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="redirect" value="admin.jsp#payment">
    <input type="hidden" name="id" value="<%= payment.getId() %>">

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="<%= payment.getEmail() %>" required>

    <label for="amount">Amount:</label>
    <input type="text" id="amount" name="amount" value="<%= payment.getAmount() %>" required>

    <label for="status">Status:</label>
    <input type="text" id="status" name="status" value="<%= payment.getStatus() %>" required>

    <label for="paymentMethod">Payment Method:</label>
    <input type="text" id="paymentmethod" name="paymentmethod" value="<%= payment.getPaymentMethod() %>" required>

    <label for="paymentDate">Payment Date:</label>
    <input type="date" id="paymentdate" name="paymentdate" value="<%= payment.getPaymentDate() %>" required>

    <button type="submit" onclick="return confirm('Do you want to update the payment details?')">Update</button>
    <br>
    <button onclick="window.location.href='admin.jsp'">Back to Admin Panel</button>
</form>
</div>
</body>
</html>
