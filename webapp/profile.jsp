<%@ page import="java.util.*, com.DFSolutions.user.*" %>
<%
    // Assuming you have a User object stored in the session
    User user = (User) request.getSession().getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if no user is found
        return;
    }

    String fullName = user.getFname() + " " + user.getLname();
    String email = user.getEmail();
    String mobile = user.getMobile();
    String address = user.getAddress();
    String userType = user.getType(); // Assuming userType is a String (e.g., "Admin", "User")
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="index.css"> <!-- Link to your CSS file -->
</head>
<body>
    <!-- Include Header -->
    <jsp:include page="components/header.jsp" />
    
    <main>
        <div class="profile-container">
            <h2>User Profile</h2>
            <form action="UserServlet" method="post">
            	<input type="hidden" name="redirect" value="profile.jsp" >
            	<input type="hidden" name="action" value="update">
            	<input type="hidden" name="email" value="<%= email %>">
            	<input type="hidden" name="type" value="<%= user.getType() %>">            	
                <div class="form-group">
                    <label for="fname">First Name:</label>
                    <input type="text" name="fname" value="<%= user.getFname() %>" >
                </div>
               <div class="form-group">
                    <label for="lname">Last Name:</label>
                    <input type="text" name="lname" value="<%= user.getLname() %>" >
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" name="email" value="<%= email %>" >
                </div>
                <div class="form-group">
                    <label for="mobile">Mobile:</label>
                    <input type="text" name="mobile" name="mobile" value="<%= mobile %>" required>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <textarea id="address" name="address" required><%= address %></textarea>
                </div>
                <div class="form-group">
                    <label for="userType">User Type:</label>
                    <input type="text" name="userType" value="<%= userType %>" readonly>
                </div>
                <button type="submit" name="action" onclick="return confirm('Are you sure you want to update?')">Update Details</button>
            </form>
            <br>
			<form action="UserServlet" method="post">
				<input type="hidden" name="action" value="delete">
				<input type="hidden" name="redirect" value="index.jsp">
				<input type="hidden" name="email" value="<%= email %>">
				<button type="submit" onclick="return confirm('Are you sure you want to delete?')">Delete Account</button>
			</form>		
				
		</div>
    </main>

    <!-- Include Footer -->
    <jsp:include page="components/footer.jsp" />
</body>
</html>
