<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Online Fuel & Vehicle Parts Service Center</title>
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>


</head>
<body>
    <!-- Header Section -->
    <%@ include file="components/header.jsp" %>

    <!-- Main Content - Signup Form -->
    <main>
        <section class="profile-container">
            <h2>Sign Up</h2>
            <p>Register for an account to access our services and special offers.</p>
            <br><br>
            <form action="RegisterServlet" method="post" id="registrationForm" class="form-container">
                <input type="hidden" name="type" value="user">
                <input type="hidden" name="action" value="register">
                
                <div class="form-group">
                    <label for="fname">First Name:</label>
                    <input type="text" id="fname" name="fname" required aria-label="First Name">
                </div>

                <div class="form-group">
                    <label for="lname">Last Name:</label>
                    <input type="text" id="lname" name="lname" required aria-label="Last Name">
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required aria-label="Email">
                </div>

                <div class="form-group">
                    <label for="hash">Password:</label>
                    <input type="password" id="hash" name="hash" required aria-label="Password">
                </div>

                <div class="form-group">
                    <label for="mobile">Mobile:</label>
                    <input type="text" id="mobile" name="mobile" required aria-label="Mobile">
                </div>
                
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" required aria-label="Address">
                </div>

                <button type="submit" name="action" > Sign Up</button>
                <p>Already have an account? <a href="login.jsp">Login here</a></p>
            </form>
        </section>
    </main>

    <!-- Footer Section -->
    <%@ include file="components/footer.jsp" %>
</body>
</html>
