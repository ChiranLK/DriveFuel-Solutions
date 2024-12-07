<%@page import="com.DFSolutions.Spart.SPartServlet"%>
<%@page import="com.DFSolutions.Spart.SPart"%>
<%@page import="com.DFSolutions.user.UserServlet"%>
<%@page import="com.DFSolutions.user.User"%>
<%@page import="com.DFSolutions.report.Report"%>
<%@page import="com.DFSolutions.report.ReportServlet"%>
<%@page import="com.DFSolutions.payment.PaymentServlet"%>
<%@page import="com.DFSolutions.payment.Payment"%>
<%@page import="com.DFSolutions.orders.OrderServlet"%>
<%@page import="com.DFSolutions.orders.Order"%>
<%@page import="com.DFSolutions.fuel.FuelServlet"%>
<%@page import="com.DFSolutions.fuel.Fuel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.DFSolutions.*, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Drive Fuel Solutions</title>
    <link rel="stylesheet" href="index.css">
    <style>
        body {
            display: flex;
            margin: 0;
            font-family: Arial, sans-serif;
        }
		.sidebar {
		    width: 200px;
		    height: 100vh; /* Full height of the viewport */
		    background-color: #2c3e50;
		    color: white;
		    padding: 15px;
		    position: fixed; /* Fixes the sidebar to the left */
		    overflow-y: auto; /* Adds scroll if content exceeds viewport height */
		}
        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 10px;
        }
        .sidebar a:hover {
            background-color: #34495e;
        }
        .container {
        background-color: #ecf0f1bd;
            padding: 20px;
            flex-grow: 1;
        }
        h2 {
            color: #2c3e50;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="#fuel" onclick="showSection('fuel')">Manage Fuel</a>
    <a href="#order" onclick="showSection('order')">Manage Orders</a>
    <a href="#payment" onclick="showSection('payment')">Manage Payments</a>
    <a href="#report" onclick="showSection('report')">Manage Reports</a>
    <a href="#user" onclick="showSection('user')">Manage Users</a>
    <a href="#spart" onclick="showSection('spart')">Manage SPart</a> 
    <a href="index.jsp" onclick="windows.location.href='index.jsp'">Home</a>
</div>

<script>
    function showSection(section) {
        const sections = document.querySelectorAll('.section');
        sections.forEach(s => {
            s.style.display = 'none';
        });
        document.getElementById(section).style.display = 'block';
    }

    // Automatically show the correct section based on the URL hash
    window.addEventListener('load', () => {
        const hash = window.location.hash.substring(1);
        if (hash) {
            showSection(hash);
        } else {
            // Default section to show when no hash is present
            showSection('fuel');
        }
    });

    window.addEventListener('hashchange', () => {
        const hash = window.location.hash.substring(1);
        if (hash) {
            showSection(hash);
        }
    });
</script>


<div class="divbox">

    <!-- Fuel Section -->
    <div id="fuel" class="section active">
        <h2>Manage Fuel</h2>
        <form action="FuelServlet" method="post">
            <input type="hidden" name="action" value="create">
            <input type="hidden" name="redirect" value="admin.jsp#fuel">
             <label for="type">Fuel Type:</label>
            <select id="type" name="type" required>
            <option value="petrol">Petrol</option>
            <option value="diesel">Diesel</option>
            </select>
            <label for="name">Fuel Name:</label>
            <input type="text" id="name" name="name" required>
            <label for="price">Price:</label>
            <input type="number" step="50" id="price" name="price" required>
            <button type="submit">Add Fuel</button>
        </form>
        <table class="tablex">
            <tr>
                <th>ID</th>
                <th>Type</th>
                <th>Name</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
            <%
                List<Fuel> fuels = FuelServlet.getAllFuel();
                for (Fuel fuel : fuels) {
            %>
                <tr>
                    <td><%= fuel.getId() %></td>
                    <td><%= fuel.getType() %></td>
                    <td><%= fuel.getName() %></td>
                    <td><%= fuel.getPrice() %></td>
                    <td>
                        <button type="button" onclick="window.location.href='updatefuel.jsp?id=<%= fuel.getId() %>'">Update</button>
                        
                        <form action="FuelServlet" method="post" style="display:inline;">
                                    <input type="hidden" name="redirect" value="admin.jsp#fuel">
                            <input type="hidden" name="id" value="<%= fuel.getId() %>">
                            <input type="hidden" name="action" value="delete">
                            <button type="submit" onclick="return confirm('Are you sure you want to delete?')">Delete</button>
                        </form>
                    </td>
                </tr>
            <%
                }
            %>
        </table>
    </div>

    <!-- Order Section -->
    <div id="order" class="section" style="display:none;">
        <h2>Manage Orders</h2>
        <form action="OrderServlet" method="post">
            <input type="hidden" name="action" value="create">
            <input type="hidden" name="redirect" value="admin.jsp#order">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="unitprice">Unit Price:</label>
            <input type="text" id="unitprice" name="unitprice" required>
            <label for="item">Item:</label>
            <input type="text" id="item" name="item" required>
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" required>
            <label for="totalprice">Total Price:</label>
            <input type="text" id="totalprice" name="totalprice" required>
            <label for="status">Status:</label>
            <input type="text" id="status" name="status" required>
            <label for="type">Type:</label>
            <input type="text" id="type" name="type" required>
            <button type="submit">Add Order</button>
        </form>
        <table class="tablex">
            <tr>
            	<th>ID</th>
                <th>Email</th>
                <th>Unit Price</th>
                <th>Item</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            <%
                List<Order> orders = OrderServlet.getAllOders();
                for (Order order : orders) {
            %>
                <tr>
                	<td><%= order.getId() %></td>
                    <td><%= order.getEmail() %></td>
                    <td><%= order.getUnitprice() %></td>
                    <td><%= order.getItem() %></td>
                    <td><%= order.getQuantity() %></td>
                    <td><%= order.getTotalprice() %></td>
                    <td><%= order.getStatus() %></td>
                    <td>
                        <button type="button" onclick="window.location.href='updateorder.jsp?id=<%= order.getId() %>'">Update</button>
                        <form action="OrderServlet" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="<%= order.getId() %>">
                            <input type="hidden" name="redirect" value="admin.jsp#order">
                            <input type="hidden" name="action" value="delete">
                            <button type="submit" onclick="return confirm('Are you sure you want to delete?')">Delete</button>
                        </form>
                    </td>
                </tr>
            <%
                }
            %>
        </table>
    </div>

    <!-- Payment Section -->
    <div id="payment" class="section" style="display:none;">
        <h2>Manage Payments</h2>
        <form action="PaymentServlet" method="post">
            <input type="hidden" name="action" value="create">
            <input type="hidden" name="redirect" value="admin.jsp#payment">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="amount">Amount:</label>
            <input type="text" id="amount" name="amount" required>
            <label for="status">Status:</label>
            <input type="text" id="status" name="status" required>
            <label for="paymentMethod">Payment Method:</label>
            <input type="text" id="paymentmethod" name="paymentmethod" required>
            <label for="paymentDate">Payment Date:</label>
            <input type="date" id="paymentdate" name="paymentdate" required>
            <button type="submit">Add Payment</button>
        </form>
        <table class="tablex">
            <tr>
                <th>ID</th>
                <th>Email</th>
                <th>Amount</th>
                <th>Status</th>
                <th>Payment Method</th>
                <th>Payment Date</th>
                <th>Actions</th>
            </tr>
            <%
                List<Payment> payments = PaymentServlet.getAllPayments();
                for (Payment payment : payments) {
            %>
                <tr>
                    <td><%= payment.getId() %></td>
                    <td><%= payment.getEmail() %></td>
                    <td><%= payment.getAmount() %></td>
                    <td><%= payment.getStatus() %></td>
                    <td><%= payment.getPaymentMethod() %></td>
                    <td><%= payment.getPaymentDate() %></td>
                    <td>
                        <button type="button" onclick="window.location.href='updatepayment.jsp?id=<%= payment.getId() %>'">Update</button>
                        <form action="PaymentServlet" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="<%= payment.getId() %>">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="redirect" value="admin.jsp#payment">
                            <button type="submit" onclick="return confirm('Are you sure you want to delete?')">Delete</button>
                        </form>
                    </td>
                </tr>
            <%
                }
            %>
        </table>
    </div>

    <!-- Report Section -->
    <div id="report" class="section" style="display:none;">
        <h2>Manage Reports</h2>
        <form action="ReportServlet" method="post">
            <input type="hidden" name="action" value="create">
            <input type="hidden" name="redirect" value="admin.jsp#report">
            <label for="text">Report Title:</label>
            <input type="text" id="text" name="text" required>
            <label for="description">Description:</label>
            <input type="text" id="description" name="description" required>
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" required>
            <label for="type">Type:</label>
            <select id="type" name="type" required>
            <option value="Fuel Station">Fuel Station</option>
            <option value="Vehicle Service">Vehicle Service</option>
            </select>
            <label for="frequency">Frequency:</label>
            <select id="frequency" name="frequency" required>
            <option value="Daily">Daily</option>
            <option value="Monthly">Monthly</option>
            <option value="Annual">Annual</option>
            </select><br><br>
            <button type="submit">Add Report</button>
        </form>
        <table class="tablex">
            <tr>
                <th>Report ID</th>
                <th>Title</th>
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
                        <button type="button" onclick="window.location.href='updatereport.jsp?id=<%= report.getReportID() %>'">Update</button>
                        <form action="ReportServlet" method="post" style="display:inline;">
                        	<input type="hidden" name="redirect" value="admin.jsp#report">
                            <input type="hidden" name="reportid" value="<%= report.getReportID() %>">
                            <input type="hidden" name="action" value="delete">
                            <button type="submit" onclick="return confirm('Are you sure you want to delete?')">Delete</button>
                        </form>
                    </td>
                </tr>
            <%
                }
            %>
        </table>
    </div>
<!-- SPart Section -->
<div id="spart" class="section" style="display:none;">
    <h2>Manage SPart</h2>
    <form action="PartServlet" method="post">
        <input type="hidden" name="action" value="create">
        <input type="hidden" name="redirect" value="admin.jsp#spart">
        <label for="name">SPart Name:</label>
        <input type="text" id="name" name="name" required>
        <label for="type">SPart Type:</label>
        <input type="text" id="type" name="type" required>
        <label for="price">Price:</label>
        <input type="number" step="50" id="price" name="price" required>
        <button type="submit">Add SPart</button>
    </form>
    <table class="tablex">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Type</th>
            <th>Price</th>
            <th>Actions</th>
        </tr>
        <%
            List<SPart> sparts = SPartServlet.getAllParts();
            for (SPart spart : sparts) {
        %>
            <tr>
                <td><%= spart.getId() %></td>
                <td><%= spart.getName() %></td>
                <td><%= spart.getType() %></td>
                <td><%= spart.getPrice() %></td>
                <td>
                    <button type="button" onclick="window.location.href='updatespart.jsp?id=<%= spart.getId() %>'">Update</button>
                    <form action="PartServlet" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= spart.getId() %>">
                        <input type="hidden" name="redirect" value="admin.jsp#spart">
                        <input type="hidden" name="action" value="delete">
                        <button type="submit" onclick="return confirm('Are you sure you want to delete?')">Delete</button>
                    </form>
                </td>
            </tr>
        <%
            }
        %>
    </table>
</div>

    <!-- User Section -->
    <div id="user" class="section" style="display:none;">
        <h2>Manage Users</h2>
        <form action="UserServlet" method="post">
            <input type="hidden" name="action" value="create">
            <input type="hidden" name="redirect" value="admin.jsp#user">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="fname">First Name:</label>
            <input type="text" id="fname" name="fname" required>
            <label for="lname">Last Name:</label>
            <input type="text" id="lname" name="lname" required>
            <label for="hash">Password:</label>
            <input type="text" id="hash" name="hash" required>
            <label for="type">User Type:</label>
            <input type="text" id="type" name="type" required>
            <label for="mobile">Mobile:</label>
            <input type="text" id="mobile" name="mobile" required>
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>
            <button type="submit">Add User</button>
        </form>
        <table class="tablex">
            <tr>
                <th>Email</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Type</th>
                <th>Mobile</th>
                <th>Address</th>
                <th>Actions</th>
            </tr>
            <%
                List<User> users = UserServlet.getAllUsers();
                for (User userx : users) {
            %>
                <tr>
                    <td><%= userx.getEmail() %></td>
                    <td><%= userx.getFname() %></td>
                    <td><%= userx.getLname() %></td>
                    <td><%= userx.getType() %></td>
                    <td><%= userx.getMobile() %></td>
                    <td><%= userx.getAddress() %></td>
                    <td>
                        <button type="button" onclick="window.location.href='updateuser.jsp?email=<%= userx.getEmail() %>'">Update</button>
                        <form action="UserServlet" method="post" style="display:inline;">
                        	<input type="hidden" name="redirect" value="admin.jsp#user">
                            <input type="hidden" name="email" value="<%= userx.getEmail() %>">
                            <input type="hidden" name="action" value="delete">
                            <button type="submit" onclick="return confirm('Are you sure you want to delete?')">Delete</button>
                        </form>
                    </td>
                </tr>
            <%
                }
            %>
        </table>
    </div>
    <br><br><br><br><br><br>
</div>

<script>
    function showSection(section) {
        const sections = document.querySelectorAll('.section');
        sections.forEach(s => {
            s.style.display = 'none';
        });
        document.getElementById(section).style.display = 'block';
    }
</script>

</body>
    <%@include file="components/footer.jsp"%> 
</html>
