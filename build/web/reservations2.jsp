<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation - Sunny Beach Resort</title>
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
            content: attr(data-value);
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
        /* Rest of your existing styles */
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
        .price-display {
            font-size: 18px;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>

    <script>
        function updatePrice() {
            var roomType = document.getElementById("roomType").value;
            var priceDisplay = document.getElementById("priceDisplay");
            var minPrice, maxPrice;

            if (roomType === "standard") {
                minPrice = 12000;
                maxPrice = 15000;
            } else if (roomType === "deluxe") {
                minPrice = 18000;
                maxPrice = 22000;
            } else if (roomType === "suite") {
                minPrice = 25000;
                maxPrice = 30000;
            }

            priceDisplay.innerHTML = "Price per night: ₹" + minPrice + " - ₹" + maxPrice;
        }
    </script>
</head>
<body>

<%
    // Define a constant hotel ID
    int hotelId = 764351; // Replace with your desired fixed hotel ID

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
        <h3 class="analytics-title">Monthly Customer Count</h3>
        <div class="graph-container">
            <div class="bar" style="height: 40%;" data-value="420"></div>
            <div class="bar" style="height: 50%;" data-value="480"></div>
            <div class="bar" style="height: 60%;" data-value="520"></div>
            <div class="bar" style="height: 70%;" data-value="580"></div>
            <div class="bar" style="height: 80%;" data-value="620"></div>
            <div class="bar" style="height: 90%;" data-value="750"></div>
            <div class="bar" style="height: 95%;" data-value="820"></div>
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

    <h1>Sunny Beach Resort</h1>

    <div class="details">
        <h2>Hotel Details</h2>
        <p><strong>Location:</strong> Luxury District</p>
        <p id="priceDisplay"><strong>Price per night:</strong> ₹12,000 - ₹15,000</p>
        <p><strong>Rating:</strong> 4.9</p>
        <p>Experience royal treatment in our luxurious and elegant hotel with world-class amenities.</p>
        <p><strong>Hotel ID:</strong> <%= hotelId %></p>
    </div>

    <!-- Hotel Images Section -->
    <div class="hotel-images">
        <img src="images/room2.jpg" alt="Luxury Royal Room">
        <img src="images/dining2.jpg" alt="Luxury Royal Dining">
    </div>

    <!-- Location Description -->
    <div class="location-description">
        <h3>Location Overview</h3>
        <p>Situated in the prestigious luxury district, the hotel offers proximity to high-end shopping, fine dining, and exclusive nightlife.</p>
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
        <select id="roomType" name="roomType" onchange="updatePrice()">
            <option value="standard">Standard Room</option>
            <option value="deluxe">Deluxe Room</option>
            <option value="suite">Royal Suite</option>
        </select>

        <label for="specialRequests">Special Requests:</label>
        <input type="text" id="specialRequests" name="specialRequests">

        <button type="submit">Reserve Now</button>
    </form>
</div>

</body>
</html>
