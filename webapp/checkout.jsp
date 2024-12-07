<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.DFSolutions.orders.*, com.DFSolutions.user.*, java.util.List, java.text.SimpleDateFormat" %>
<%@ page import="com.DFSolutions.fuel.*, com.DFSolutions.user.*, com.DFSolutions.orders.*,
 java.util.List, java.util.ArrayList, java.text.SimpleDateFormat" %>
<%
    User userx = (User) request.getSession().getAttribute("user");

    // Redirect if user is not logged in
    if (userx == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Fetch all orders for the user
    List<Order> orderList = OrderServlet.getAllOders(); // Ensure this method exists
    double totalprice = 0;

    for (Order order : orderList) {
        totalprice += Double.valueOf(order.getTotalprice());
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <link rel="stylesheet" href="index.css">
</head>
<body>
<%@include file="components/header.jsp" %>

<div class="divbox">
    <h1>Checkout</h1>
    
    <h2>Your Orders</h2>
    <table class="tablex">
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Email</th>
                <th>Item</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (Order order : orderList) {
        %>
            <tr>
                <td><%= order.getId() %></td>
                <td><%= order.getEmail() %></td>
                <td><%= order.getItem() %></td>
                <td><%= order.getQuantity() %></td>
                <td><%= order.getTotalprice() %></td>
                <td><%= order.getStatus() %></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <h3>Total Price: Rs. <%= totalprice %></h3>

<form action="PaymentServlet" method="post" >
    <input type="hidden" name="action" value="create">\
    <input type="hidden" name="redirect" value="paymentSuccesfull.jsp">
    <input type="hidden" name="email" value="<%= userx.getEmail() %>">
    <input type="hidden" name="amount" value="<%= totalprice %>">
    <input type="hidden" name="status" value="Completed">
    <label for="paymentMethod">Payment Method:</label>
    <input type="text" name="paymentmethod" value="VISA">
    <input type="hidden" name="paymentdate" value="<%= new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">
    <button type="submit">Pay and Delete All Orders</button>
</form>

</div>
</body>
</html>
