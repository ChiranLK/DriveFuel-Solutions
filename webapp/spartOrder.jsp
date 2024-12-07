<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.DFSolutions.Spart.*, com.DFSolutions.user.*, com.DFSolutions.orders.*,
 java.util.List, java.util.ArrayList, java.text.SimpleDateFormat" %>

<%
	String spartname = request.getSession().getAttribute("spartname").toString();
    SPart sPart = SPartServlet.getPart(spartname);
    User userx = (User) request.getSession().getAttribute("user");
    List<Order> orderList = new ArrayList<Order>();

    // Get all orders
    orderList = OrderServlet.getAllOders(); // Ensure this method exists

    // Redirect if user is not logged in
    if (userx == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head> 
    <meta charset="UTF-8">
    <title>Checkout</title>
    <link rel="stylesheet" href="index.css">
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function() {
            const quantityInput = document.getElementById('quantity');
            const output = document.getElementById('totalprice');
            const pricePerLiter = <%= sPart.getPrice() %>;

            function updateOutput() {
                const quantity = parseInt(quantityInput.value) || 0;
                const totalPrice = (quantity * pricePerLiter).toFixed(2);
                output.value = totalPrice;
                output.textContent = "Total Price = " + totalPrice + " Rs.";
            }

            quantityInput.addEventListener('input', updateOutput);
            updateOutput();
        });
    </script>
</head>
<body>
<%@include file="components/header.jsp" %>

<div class="container">
    <div class="divbox">
        <h1>Add Order</h1>
        <h2>Your Order Summary</h2>
        <p>You are purchasing: <strong><%= sPart.getName() %></strong></p>
        <p>Price Per 1 Liter: Rs.<strong><%= sPart.getPrice() %></strong></p>

        <form action="OrderServlet" method="post">
            <input type="hidden" name="status" value="pending">
            <input type="hidden" name="item" value="<%= sPart.getName() %>">
            <input type="hidden" name="redirect" value="<%= request.getRequestURI() %>">
            <input type="hidden" name="action" value="create">
            <input type="hidden" name="email" value="<%= userx.getEmail() %>">
            <input type="hidden" name="unitprice" value="<%= sPart.getPrice() %>">
            <label for="quantity">Quantity (Liters):</label>
            <input type="number" id="quantity" name="quantity" value="1" min="1" max="100" required>
            <input type="hidden" id="totalprice" name="totalprice" value="0">
            <input type="hidden" id="type" name="type" value="Service Part">
            <input type="hidden" name="fuelId" value="<%= sPart.getId() %>">
            <button type="submit">Add To Cart</button>
        </form>

        <form action="services.jsp" method="get">
            <br><br>
            <button type="submit">Back To Shopping Without This Order</button>
        </form>
    </div>
    <div class="divbox">
        <h3>Shopping Cart</h3>
        <table class="tablex">
            <thead>
                <tr>
                	<th>Order ID</th>
                    <th>Email</th>
                    <th>Item</th>   
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>Status</th>
                    <th>Type</th>
                    <th>Update Quantity</th>
                    <th>Delete</th>  
                </tr>
            </thead>
            <tbody>
            <%
            	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            	double totalprice = 0;
                for (Order order : orderList) {
            %>
                <tr>
                	<td><%= order.getId() %></td>
                    <td><%= order.getEmail() %></td> 
                    <td><%= order.getItem() %></td>
                    <td><%= order.getQuantity() %></td>
                    <td><%= order.getTotalprice() %></td>
                    <td><%= order.getStatus() %></td>
                    <td><%= order.getType() %></td>
                    <td>
                        <form action="OrderServlet" method="post" style="display:inline;">
                        	<input type="hidden" name="redirect" value="fuelOrder.jsp">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="id" value="<%= order.getId()%>">
                            <input type="hidden" name="unitprice" value="<%= order.getUnitprice()%>">
                            <input type="hidden" name="totalprice" value="<%= order.getTotalprice()%>">
                            <input type="number" name="quantity" value="<%=order.getQuantity() %>">
                            <input type="hidden" name="status" value="<%= order.getStatus()%>">
                            <button type="submit">Update Quantity</button>
                        </form>
                    </td>
                    <td>
                        <form action="OrderServlet" method="post" style="display:inline;">
                        	<input type="hidden" name="redirect" value="fuelOrder.jsp">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="item" value="<%= order.getItem()%>"> 
                            <input type="hidden" name="id" value="<%= order.getId()%>">
                            <button type="submit">Delete</button>
                        </form>
                   </td>
                </tr>
            <%
                totalprice += Double.valueOf(order.getTotalprice());
                }
            %>
            </tbody>
        </table>
                	<label for="totalprice">Total Price: <%= totalprice %></label>
        <button type="button" onclick="window.location.href='checkout.jsp';" >Checkout</button>
    </div>
</div>
</body>
</html>
