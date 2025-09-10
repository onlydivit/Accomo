<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation - Desert Mirage Hotel</title>
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
            background: linear-gradient(to top, #2196F3, #1E88E5);
            border-radius: 4px 4px 0 0;
            position: relative;
            transition: background-color 0.3s ease;
        }
        .bar:hover {
            background: linear-gradient(to top, #1976D2, #1565C0);
        }
        .bar::after {
            content: attr(data-occupancy) "%";
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
    int hotelId = 642879;
    
    // Generate random 3-digit room ID between 001 and 300
    Random random = new Random();
    int randomRoomId = random.nextInt(300) + 1;
    String formattedRoomId = String.format("%03d", randomRoomId);

    // Simulate getting a customerId
    String customerId = "C" + String.format("%05d", random.nextInt(99999) + 1);
%>

<div class="container">
    <!-- Analytics Container with Occupancy Rates Bar Graph -->
    <div class="analytics-container">
        <h3 class="analytics-title">Room Occupancy Rates</h3>
        <div class="graph-container">
            <div class="bar" style="height: 60%;" data-occupancy="60"></div> <!-- Winter -->
            <div class="bar" style="height: 75%;" data-occupancy="75"></div> <!-- Spring -->
            <div class="bar" style="height: 90%;" data-occupancy="90"></div> <!-- Summer -->
            <div class="bar" style="height: 50%;" data-occupancy="50"></div> <!-- Fall -->
        </div>
        <div class="season-labels">
            <span>Winter</span>
            <span>Spring</span>
            <span>Summer</span>
            <span>Fall</span>
        </div>
    </div>

    <h1>Hotel Trident</h1>

    <div class="details">
        <h2>Hotel Details</h2>
        <p><strong>Location:</strong> Desert Oasis</p>
        <p><strong>Price per night:</strong> ₹10,000 - ₹15,000</p>
        <p><strong>Rating:</strong> 4.3</p>
        <p>Discover serenity in our desert retreat with luxurious rooms and a calming oasis pool.</p>
        <p><strong>Hotel ID:</strong> <%= hotelId %></p>
    </div>

    <!-- Hotel Images Section -->
    <div class="hotel-images">
        <img src="images/room10.jpg" alt="Deluxe Room Image">
        <img src="images/pool10.jpg" alt="Oasis Pool Image">
    </div>

    <!-- Location Description -->
    <div class="location-description">
        <h3>Location Overview</h3>
        <p>The Desert Mirage Hotel is located in the heart of a stunning desert oasis. The surrounding area offers opportunities for adventure, including desert safaris, dune rides, and beautiful sunsets. Enjoy nearby attractions like local artisan markets, fine dining, and cultural tours.</p>
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
            <option value="standard">Standard Room</option>
            <option value="deluxe">Deluxe Room</option>
            <option value="suite">Luxury Suite</option>
            <option value="villa">Private Villa</option>
            <option value="family">Family Suite</option>
        </select>

        <label for="specialRequests">Special Requests:</label>
        <input type="text" id="specialRequests" name="specialRequests">

        <button type="submit">Reserve Now</button>
    </form>
</div>

</body>
</html>
