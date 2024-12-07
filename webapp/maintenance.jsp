<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Maintenance</title>
    <link rel="stylesheet" href="index.css">
</head>
<body>
    <!-- Header Section -->
    <%@ include file="components/header.jsp" %>

    <!-- Main Content -->
    <main>
        <div class="divbox">
        <h2>Vehicle Maintenance Services</h2>
        <p>Regular vehicle maintenance is essential to ensure the longevity and performance of your vehicle. Our service center provides a full range of maintenance services, including:</p>
        <ul>
            <li>Oil Change</li>
            <li>Brake Service</li>
            <li>Battery Replacement</li>
            <li>Tire Rotation and Alignment</li>
            <li>Engine Diagnostics</li>
            <li>Scheduled Maintenance</li>
        </ul>
        <p>Our certified technicians are equipped to handle all your vehicle's maintenance needs. Book an appointment today!</p>
        <a href="services.jsp" class="cta-button">Book Maintenance Now</a>
        </div>
    </main>

    <!-- Footer Section -->
    <%@ include file="components/footer.jsp" %>
</body>
</html>
