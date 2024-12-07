<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="stylesheet" href="index.css">
</head>
<body>
    <!-- Include Header -->
    <%@ include file="components/header.jsp" %>

    <!-- Main Content -->
    <main>
        <div class="divbox">
        <h2>About Us</h2>
        <p>We are a leading provider of fuel delivery and vehicle parts services, committed to making vehicle maintenance easier and more accessible. Our team is dedicated to providing the highest level of customer service, ensuring that all your vehicle needs are met with speed and efficiency.</p>
        <p>With years of experience in the industry, we have built a reputation for reliability and trustworthiness. We believe in delivering quality products and services at competitive prices.</p>
        <p><strong>Our Mission:</strong> To be the go-to service provider for all fuel and vehicle parts needs, offering convenience, reliability, and customer satisfaction.</p>
    	</div>
    </main>

    <!-- Include Footer -->
    <jsp:include page="components/footer.jsp" />
</body>
</html>
