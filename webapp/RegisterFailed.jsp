<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Failed</title>
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
</head>
<body>
    <!-- Header Section -->
    <%@ include file="components/header.jsp" %>

    <!-- Main Content - Failure Message -->
    <main>
        <section class="profile-container">
            <h2>Registration Failed</h2>
            <p>Sorry, there was an issue with your registration. Please try again later.</p>
            <br><br>
            <a href="signup.jsp" class="button">Back to Sign Up</a>
        </section>
    </main>

    <!-- Footer Section -->
    <%@ include file="components/footer.jsp" %>
</body>
</html>
