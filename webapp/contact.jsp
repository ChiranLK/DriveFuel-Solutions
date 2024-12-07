<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="stylesheet" href="index.css">
</head>
<body>
    <!-- Include Header -->
    <%@ include file="components/header.jsp" %>

    <!-- Main Content -->
    <main>
    <div class="divbox">
        <h2>Contact Us</h2>
        <p>If you have any questions or would like more information about our services, feel free to contact us.</p>
        <p><strong>Phone:</strong> +94 123 456 789</p>
        <p><strong>Email:</strong> support@fuelparts.com</p>
        <p><strong>Address:</strong> 123 Main Street, Colombo, Sri Lanka</p>
        <form action="contactForm.jsp" method="POST">
            <label for="name">Your Name:</label><br>
            <input type="text" id="name" name="name" required><br><br>

            <label for="email">Your Email:</label><br>
            <input type="email" id="email" name="email" required><br><br>

            <label for="message">Your Message:</label><br>
            <textarea id="message" name="message" rows="5" required></textarea><br><br>

            <input type="submit" value="Send Message" class="cta-button">
        </form>	
        </div>
    </main>

    <!-- Footer Section -->
    <%@ include file="components/footer.jsp" %>
</body>
</html>
