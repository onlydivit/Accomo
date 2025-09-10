<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation - Oceanfront Paradise</title>
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
            position: relative;
        }
        .analytics-container {
            position: absolute;
            top: 20px;
            right: 20px;
            width: 300px;
            background-color: white;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .analytics-title {
            text-align: center;
            font-size: 14px;
            margin-bottom: 15px;
            color: #333;
        }
        .graph-container {
            height: 200px;
            display: flex;
            align-items: flex-end;
            gap: 15px;
            padding: 10px 0;
            border-bottom: 2px solid #eee;
            position: relative;
        }
        .bar {
            flex: 1;
            background: linear-gradient(to top, #2563eb, #60a5fa);
            border-radius: 4px 4px 0 0;
            position: relative;
            transition: height 0.3s ease;
        }
        .bar:hover {
            background: linear-gradient(to top, #1e40af, #3b82f6);
        }
        .bar::after {
            content: attr(data-value) "%";
            position: absolute;
            top: -20px;
            left: 50%;
            transform: translateX(-50%);
            font-size: 12px;
            color: #666;
        }
        .month-labels {
            display: flex;
            justify-content: space-between;
            margin-top: 8px;
            padding: 0 5px;
        }
        .month-label {
            font-size: 11px;
            color: #666;
            flex: 1;
            text-align: center;
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
    int hotelId = 986045;  // Replace with your desired fixed hotel ID
    
    // Generate random 3-digit room ID between 001 and 300
    Random random = new Random();
    int randomRoomId = random.nextInt(300) + 1;
    String formattedRoomId = String.format("%03d", randomRoomId); // Ensures it's always 3 digits

    // Simulate getting a customerId (replace this logic with your dynamic ID generation)
    String customerId = "C" + String.format("%05d", random.nextInt(99999) + 1); // Example customer ID: CXXXXX
%>

<div class="container">
    <!-- Analytics Container with Bar Graph -->
    <div class="analytics-container">
        <h3 class="analytics-title">Monthly Occupancy Rate</h3>
        <div class="graph-container">
            <div class="bar" style="height: 70%;" data-value="70"></div>
            <div class="bar" style="height: 75%;" data-value="75"></div>
            <div class="bar" style="height: 85%;" data-value="85"></div>
            <div class="bar" style="height: 90%;" data-value="90"></div>
            <div class="bar" style="height: 95%;" data-value="95"></div>
            <div class="bar" style="height: 80%;" data-value="80"></div>
            <div class="bar" style="height: 60%;" data-value="60"></div>
        </div>
        <div class="month-labels">
            <div class="month-label">Jan</div>
            <div class="month-label">Feb</div>
            <div class="month-label">Mar</div>
            <div class="month-label">Apr</div>
            <div class="month-label">May</div>
            <div class="month-label">Jun</div>
            <div class="month-label">Jul</div>
        </div>
    </div>

    <h1>Mountain Escape Lodge</h1>

    <div class="details">
        <h2>Hotel Details</h2>
        <p><strong>Location:</strong> mountains</p>
        <p><strong>Price per night:</strong> ₹35,000 - ₹40,000</p>
        <p><strong>Rating:</strong> 4.7</p>
        <p>Stay at our Mountain Escape Lodge and enjoy breathtaking views of the mountain with luxury accommodations.</p>
        <p><strong>Hotel ID:</strong> <%= hotelId %></p>
    </div>

    <!-- Hotel Images Section -->
    <div class="hotel-images">
        <img src="images/room3.jpg" alt="Mountain Escape Lodge Room">
        <img src="images/pool3.jpg" alt="Mountain Escape Lodge Pool">
    </div>

    <!-- Location Description -->
    <div class="location-description">
        <h3>Location Overview</h3>
        <p>Our hotel is situated right on the beach, offering direct access to white sandy shores, water sports, and nearby beach cafes.</p>
    </div>

    <h2>Make a Reservation</h2>

    <!-- Reservation Form -->
    <form class="reservation-form" action="confirmReservation.jsp" method="POST">
        <input type="hidden" id="customerId" name="customerId" value="<%= customerId %>">
        <input type="hidden" id="roomId" name="roomId" value="<%= formattedRoomId %>">
        <input type="hidden" id="hotelId" name="hotelId" value="<%= hotelId %>">

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
        </select>

        <label for="specialRequests">Special Requests:</label>
        <input type="text" id="specialRequests" name="specialRequests">

        <button type="submit">Reserve Now</button>
    </form>
</div>

</body>
</html>
