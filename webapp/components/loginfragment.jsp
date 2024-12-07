<div class="profile-container">
	<h2>Login</h2>
    <form action="UserServlet" method="POST" class="form-container">
		<input type="hidden" name="action" value="login">
		<input type="hidden" name="redirect" value="<%= request.getRequestURI() %>">
		<label for="email">Email:</label><br>
		<input type="text" id="email" name="email" required><br>
		
		<label for="password">Password:</label><br>
		<input type="password" id="password" name="password" required><br>
		
		<button type="submit" class="cta-button">Login</button><br>
		
		<p>Don't have an account? <a href="signup.jsp">Sign Up here</a></p>
	</form>
</div>