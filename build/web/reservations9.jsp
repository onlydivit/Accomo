<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation - Forest Cabin Hideaway</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 900px;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .analytics-container {
            width: 100%;
            background-color: #fff;
            padding: 15px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .analytics-title {
            text-align: center;
            font-size: 16px;
            color: #444;
            margin-bottom: 15px;
        }
        .graph-container {
            display: flex;
            justify-content: space-around;
            align-items: flex-end;
            height: 200px;
            border-bottom: 2px solid #ddd;
            padding: 0 10px;
            margin-bottom: 10px;
        }
        .bar {
            width: 50px;
            background: linear-gradient(to top, #FFAB40, #FFA726);
            border-radius: 4px 4px 0 0;
            position: relative;
            transition: background-color 0.3s ease;
        }
        .bar:hover {
            background: linear-gradient(to top, #FB8C00, #F57C00);
        }
        .bar::after {
            content: attr(data-availability) "%";
            position: absolute;
            top: -25px;
            left: 50%;
            transform: translateX(-50%);
            font-size: 12px;
            color: #666;
        }
        .season-labels {
            display: flex;
            justify-content: space-around;
            padding: 0 10px;
            color: #666;
            font-size: 12px;
        }
        h1 {
            text-align: center;
        }
        .details {
            margin-bottom: 30px;
        }
        .hotel-images {
            display: flex;
            justify-content: space-between;
            gap: 10px;
            margin-top: 20px;
        }
        .hotel-images img {
            width: 48%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }
        .location-description {
            margin-top: 20px;
            background-color: #eaeaea;
            padding: 15px;
            border-radius: 8px;
        }
        .reservation-form {
            display: flex;
            flex-direction: column;
        }
        .reservation-form label {
            margin-top: 10px;
        }
        .reservation-form input, .reservation-form select {
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 20px;
            width: 100%;
        }
        .reservation-form button {
            padding: 10px;
            background-color: #5cb85c;
            color: white;
            border: none;
            cursor: pointer;
        }
        .reservation-form button:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>

<%
    // Define a constant hotel ID
    int hotelId = 147382;
    
    // Generate random 3-digit room ID between 001 and 300
    Random random = new Random();
    int randomRoomId = random.nextInt(300) + 1;
    String formattedRoomId = String.format("%03d", randomRoomId);

    // Simulate getting a customerId
    String customerId = "C" + String.format("%05d", random.nextInt(99999) + 1);
%>

<div class="container">
    <!-- Analytics Container with Seasonal Availability Bar Graph -->
    <div class="analytics-container">
        <h3 class="analytics-title">Seasonal Availability Rates</h3>
        <div class="graph-container">
            <div class="bar" style="height: 75%;" data-availability="75"></div> <!-- Winter -->
            <div class="bar" style="height: 65%;" data-availability="65"></div> <!-- Spring -->
            <div class="bar" style="height: 40%;" data-availability="40"></div> <!-- Summer -->
            <div class="bar" style="height: 85%;" data-availability="85"></div> <!-- Fall -->
        </div>
        <div class="season-labels">
            <span>Winter</span>
            <span>Spring</span>
            <span>Summer</span>
            <span>Fall</span>
        </div>
    </div>

    <h1>Forest Cabin Hideaway</h1>

    <div class="details">
        <h2>Hotel Details</h2>
        <p><strong>Location:</strong> Forest Retreat</p>
        <p><strong>Price per night:</strong> ₹35,000 - ₹40,000</p>
        <p><strong>Rating:</strong> 4.8</p>
        <p>Unwind in our secluded cabins surrounded by forest, perfect for a peaceful and cozy retreat in nature.</p>
        <p><strong>Hotel ID:</strong> <%= hotelId %></p>
    </div>

    <!-- Hotel Images Section -->
    <div class="hotel-images">
        <img src="images/room9.jpg" alt="Cabin Room">
        <img src="images/game.jpg" alt="Forest View">
    </div>

    <!-- Location Description -->
    <div class="location-description">
        <h3>Location Overview</h3>
        <p>The resort is nestled deep in the woods, offering hiking trails, nature walks, and campfire nights under the stars.</p>
    </div>

    <h2>Make a Reservation</h2>

    <form class="reservation-form" action="confirmReservation.jsp" method="POST">
        <!-- Hidden fields for customerId and roomId -->
        <input type="hidden" id="customerId" name="customerId" value="<%= customerId %>">
        <input type="hidden" id="roomId" name="roomId" value="<%= formattedRoomId %>">

        <label for="checkin">Check-in Date:</label>
        <input type="date" id="checkin" name="checkin" required>

        <label for="checkout">Check-out Date:</label>
        <input type="date" id="checkout" name="checkout" required>

        <label for="guests">Number of Guests:</label>
        <input type="number" id="guests" name="guests" min="1" max="10" required>

        <label for="roomType">Room Type:</label>
        <select id="roomType" name="roomType">
            <option value="standard">Standard Cabin</option>
            <option value="deluxe">Deluxe Cabin</option>
            <option value="suite">Forest Suite</option>
        </select>

        <label for="specialRequests">Special Requests:</label>
        <input type="text" id="specialRequests" name="specialRequests">

        <button type="submit">Reserve Now</button>
    </form>
</div>

</body>
</html>
