<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation - City Central Plaza</title>
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
            justify-content: space-between;
            align-items: flex-end;
            height: 200px;
            border-bottom: 2px solid #ddd;
            padding: 0 10px;
            margin-bottom: 10px;
        }
        .bar {
            width: 30px;
            background: linear-gradient(to top, #FFB74D, #FFA726);
            border-radius: 4px 4px 0 0;
            position: relative;
            transition: background-color 0.3s ease;
        }
        .bar:hover {
            background: linear-gradient(to top, #FF9800, #FB8C00);
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
        .month-labels {
            display: flex;
            justify-content: space-between;
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
    int hotelId = 327862;
    
    // Generate random 3-digit room ID between 001 and 300
    Random random = new Random();
    int randomRoomId = random.nextInt(300) + 1;
    String formattedRoomId = String.format("%03d", randomRoomId);

    // Simulate getting a customerId
    String customerId = "C" + String.format("%05d", random.nextInt(99999) + 1);
%>

<div class="container">
    <!-- Analytics Container with Bar Graph -->
    <div class="analytics-container">
        <h3 class="analytics-title">Monthly Occupancy Rates</h3>
        <div class="graph-container">
            <div class="bar" style="height: 65%;" data-occupancy="65"></div>
            <div class="bar" style="height: 72%;" data-occupancy="72"></div>
            <div class="bar" style="height: 85%;" data-occupancy="85"></div>
            <div class="bar" style="height: 70%;" data-occupancy="70"></div>
            <div class="bar" style="height: 60%;" data-occupancy="60"></div>
            <div class="bar" style="height: 75%;" data-occupancy="75"></div>
        </div>
        <div class="month-labels">
            <span>Jan</span>
            <span>Feb</span>
            <span>Mar</span>
            <span>Apr</span>
            <span>May</span>
            <span>Jun</span>
        </div>
    </div>

    <h1>City Central Plaza</h1>

    <div class="details">
        <h2>Hotel Details</h2>
        <p><strong>Location:</strong> Desert Haven</p>
        <p><strong>Price per night:</strong> ₹25,000 - ₹30,000</p>
        <p><strong>Rating:</strong> 4.6</p>
        <p>Escape to a luxury resort in the heart of the desert, offering a peaceful oasis and breathtaking sunsets.</p>
        <p><strong>Hotel ID:</strong> <%= hotelId %></p>
    </div>

    <!-- Hotel Images Section -->
    <div class="hotel-images">
        <img src="images/room7.jpg" alt="Desert Oasis Room">
        <img src="images/gym.jpg" alt="Desert View">
    </div>

    <!-- Location Description -->
    <div class="location-description">
        <h3>Location Overview</h3>
        <p>Set in the serene desert, the resort offers spa treatments, camel rides, and guided stargazing tours.</p>
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
        </select>

        <label for="specialRequests">Special Requests:</label>
        <input type="text" id="specialRequests" name="specialRequests">

        <button type="submit">Reserve Now</button>
    </form>
</div>

</body>
</html>
