<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful</title>
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
</head>
<body>
    <!-- Header Section -->
    <%@ include file="components/header.jsp" %>

    <!-- Main Content - Success Message -->
    <main>
        <section class="profile-container">
            <h2>Registration Successful!</h2>
            <p>Thank you for registering. You can now log in to your account and enjoy our services.</p>
            <br><br>
            <Button onclick="window.location='login.jsp'" class="button">Go to Login Page</Button>
        </section>
    </main>

    <!-- Footer Section -->
    <%@ include file="components/footer.jsp" %>
</body>
</html>
