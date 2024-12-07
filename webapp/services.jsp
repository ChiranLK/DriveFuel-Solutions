<%@page import="com.DFSolutions.dbhelper.DBConnector"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.DFSolutions.fuel.*,com.DFSolutions.Spart.*" %>
<%
	List<Fuel> fuelProducts = FuelServlet.getAllFuel();
    List<SPart> vehicleParts = SPartServlet.getAllParts();
%>
<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Buy Fuel and Vehicle Parts</title>

    <link rel="stylesheet" href="index.css">
        	<%@include file="components/header.jsp" %>
</head>
<body>


			   <div class = "divbox">
			   			   <h1>Purchase Fuel and Vehicle Parts</h1>
			   			   <div class="container">
			<div class="fuel">

			
			   <h2>Fuel Products</h2>
			   <table class="tablex">
			       <tr>
			           <th>Name</th>
			           <th>Price</th>
			           <th>Action</th>
			       </tr>
			       <%
			           for (Fuel fuel : fuelProducts) {
			       %>
			       <tr>
			           <td><%= fuel.getName() %></td>
			           <td><%= fuel.getPrice() %></td>
			           <td>
			           <form action="OrderServlet" method="post">
			           <input type="hidden" name="action" value="redirectfuel">
			           		<input type="hidden" name="redirect" value="fuelOrder.jsp">
			                <input type="hidden" name="fuelname" value="<%=fuel.getName()%>">
						    <button type="submit">Buy</button>
						</form>
						</td>
			       </tr>
			       <%
			           }
			       %>
			   </table>
			</div>
		</div>
	<div class="container">
			<div class="fuel">
    <h2>Vehicle Parts</h2>
    <table class="tablex">
        <tr>
            <th>Name</th>
            <th>Price</th>
            <th>Action</th>
        </tr>
        <%
            for (SPart sPart : vehicleParts) {
        %>
        <tr>
            <td><%= sPart.getName() %></td>
            <td><%= sPart.getPrice() %></td>
            <td>
	           <form action="OrderServlet" method="post">
	           <input type="hidden" name="action" value="redirectorder">
	           		<input type="hidden" name="redirect" value="spartOrder.jsp">
	                <input type="hidden" name="spartname" value="<%=sPart.getName()%>">
				    <button type="submit">Buy</button>
				</form>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    			</div>
		</div>
			   </div>
			           	<%@include file="components/footer.jsp" %>
	
</body>
</html>
