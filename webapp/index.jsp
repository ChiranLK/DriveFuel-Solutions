<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head> 
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Fuel & Vehicle Parts Service Center</title>
    <link rel="stylesheet" href="index.css"> <!-- Link to your CSS file -->
</head>
<body>
    <!-- Include Header -->
    <%@ include file="components/header.jsp" %>
 
    <!-- Main Section -->
    <main>
        <div class="banner">
            <h2>Reliable Fuel Delivery and Genuine Vehicle Parts</h2>
            <p>We deliver fuel and vehicle parts directly to your location.</p>
            <a href="services.jsp" class="cta-button">Explore Services</a>
        </div>
		<div class="servicescontainer">
			<section class="services">
	            <h3>Our Services</h3>
	            <div class="service-grid">
	                <div class="service-item">
	                    <h4>Fuel Delivery</h4>
	                    <p>Get fuel delivered to your location quickly and safely.</p>
	                    <a href="fuelDelivery.jsp">Learn More</a>
	                </div>	                <div class="service-item">
	                    <h4>Vehicle Parts</h4>
	                    <p>Order genuine vehicle parts with delivery and installation.</p>
	                    <a href="vehicleParts.jsp">Learn More</a>
	                </div>
	                <div class="service-item">
	                    <h4>Maintenance Services</h4>
	                    <p>Vehicle maintenance and repair services at your convenience.</p>
	                    <a href="maintenance.jsp">Learn More</a>
	                </div>
	            </div>
        	</section>
		</div>
    </main>

    <!-- Footer Section -->
    <%@ include file="components/footer.jsp" %>

</body>
</html>
