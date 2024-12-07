<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Error</title>
    <link rel="stylesheet" href="index.css"> <!-- Assuming your styles are in index.css -->
</head>
<body>

    <!-- Include Header -->
    <%@ include file="components/header.jsp" %>

    <!-- Main Content -->
    <main>
        <div class="divbox">
            <h2>Login Failed</h2>
            <p>Sorry, the username or password you entered is incorrect. Please try again.</p>
            <a class="retry-button">Try Again</a>
            <%@ include file="components/loginfragment.jsp" %>
        </div>
    </main>
    
    

    <!-- Include Footer -->
    <%@ include file="components/footer.jsp" %>

</body>
</html>
