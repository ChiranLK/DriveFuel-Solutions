<!-- Header Section -->
<%@ page import="java.util.*, com.DFSolutions.user.*" %>

<%
	User user = (User) request.getSession().getAttribute("user");
	String type = (String) request.getSession().getAttribute("type");
%>
<header>
    <div class="container">
        <h1>Drive Fuel Solutions</h1>
        <nav>
            <ul>
                <li>
                    <a href="index.jsp" 
                       class="<%= request.getRequestURI().contains("index.jsp") ? "active" : "" %>">
                        Home
                    </a>
                </li>
                <li>
                    <a href="fuelDelivery.jsp" 
                       class="<%= request.getRequestURI().contains("fuelDelivery.jsp") ? "active" : "" %>">
                        Fuel Delivery
                    </a>
                </li>
                <li>
                    <a href="vehicleParts.jsp" 
                       class="<%= request.getRequestURI().contains("vehicleParts.jsp") ? "active" : "" %>">
                        Vehicle Parts
                    </a>
                </li>
                <li>
                    <a href="aboutUs.jsp" 
                       class="<%= request.getRequestURI().contains("aboutUs.jsp") ? "active" : "" %>">
                        About Us
                    </a>
                </li>
                <li>
                    <a href="contact.jsp" 
                       class="<%= request.getRequestURI().contains("contact.jsp") ? "active" : "" %>">
                        Contact
                    </a>
                </li>
               	<li>
                    <a href="services.jsp" 
                       class="<%= request.getRequestURI().contains("services.jsp") ? "active" : "" %>">
                        Services
                    </a>
                </li>
				<%
				 if (user != null && type.equals("admin")) {			
				%>
				
				<li>
                    <a href="admin.jsp"
                    class="<%=request.getRequestURI().contains("admin") ? "active" : ""%>">
                        Admin Panel
                    </a>
				</li>
				<li>
					<a href="report.jsp"
					class="<%=request.getRequestURI().contains("report") ? "active" : ""%>">
						Reports - Admin
					</a>
				</li>
				<%
				 } else {
				%>
				<li>
                    <a href="UserReport.jsp" 
                       class="<%= request.getRequestURI().contains("services.jsp") ? "active" : "" %>">
                        Reports
                    </a>
                </li> 
                <%
				 }
                %>
			</ul>
        </nav>
        <div class="login-signup">
        
        <%
                if (user == null) {
                %>
            <button onclick="location.href='login.jsp'"
               class="login-signup <%= request.getRequestURI().contains("login.jsp") ? "active" : "" %>">Login  </button> 
            
            <button onclick="location.href='signup.jsp'"
               class="login-signup <%= request.getRequestURI().contains("signup.jsp") ? "active" : "" %>"> Sign Up</button>
		<%
        	} else {
		%>
			<a href="profile.jsp" class="<%= request.getRequestURI().contains("profile.jsp") ? "active" : "" %>">Profile - <%=(user.getEmail() + "\n" + user.getFname() + " " + user.getLname() + " " +  request.getSession().getAttribute("type"))%></a> | 

			<form action="UserServlet" method="post" style="display: inline;">
			    <input type="hidden" name="action" value="logout">
			    <input type="hidden" name="redirect" value="<%= request.getRequestURI() %>">
			    <button class="login-signup" onclick="return confirm('Are you sure you want to logout?');" type="submit">Logout</button>
			</form>
			
		<%
        	}
	    %>
			
		</div>
    </div>
</header>
