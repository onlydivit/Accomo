<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.Dao.Reservation1Dao" %>
<%@ page import="com.bean.Reservation1Bean" %>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation - Grand Palace Hotel</title>
    <style>
        /* CSS Styles (similar to your original file) */
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
        h1, h2 {
            text-align: center;
        }
        .details {
            margin-bottom: 30px;
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
        .message {
            text-align: center;
            font-size: 18px;
            color: red;
            margin-top: 20px;
        }
    </style>
    <script>
        function updatePrice() {
            var roomType = document.getElementById("roomType").value;
            var priceDisplay = document.getElementById("priceDisplay");
            var minPrice, maxPrice;

            if (roomType === "standard") {
                minPrice = 10000;
                maxPrice = 12000;
            } else if (roomType === "deluxe") {
                minPrice = 15000;
                maxPrice = 18000;
            } else if (roomType === "suite") {
                minPrice = 20000;
                maxPrice = 25000;
            }

            priceDisplay.value = minPrice + " - " + maxPrice;
        }
    </script>
</head>
<body>
    
<%
    // Your existing JSP code
    String minPrice = request.getParameter("minPrice");
    String maxPrice = request.getParameter("maxPrice");

    if (minPrice == null) {
        minPrice = "10000";
    }
    if (maxPrice == null) {
        maxPrice = "12000";
    }

    int hotelId = 234874;
    Reservation1Dao reservationDao = new Reservation1Dao();
    int currentReservations = reservationDao.getReservationCount(hotelId);
    boolean isFullyBooked = currentReservations >= 4;

    // Generate random values for roomId and customerId
    Random random = new Random();
    int randomRoomId = random.nextInt(300) + 1;
    String formattedRoomId = String.format("%03d", randomRoomId);
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
    
        <div class="hotel-images">
        <img src="images/room1.jpg" alt="Grand Palace Room">
        <img src="images/lobby1.jpg" alt="Grand Palace Lobby">
    </div>

<div class="container">
    <h1>Hotel Grand Palace</h1>

    <div class="details">
        <h2>Hotel Details</h2>
        <p><strong>Location:</strong> City Center</p>
        <p><strong>Price per night:</strong> ₹10000 - ₹25000</p>
        <p><strong>Rating:</strong> 4.5</p>
        <p>Luxury hotel in the heart of the city, with exquisite service and a royal ambiance.</p>
        <p><strong>Hotel ID:</strong> <%= hotelId %></p>
    </div>

    <div class="location-description">
        <h3>Location Overview</h3>
        <p>The Grand Palace Hotel is situated in the bustling city center, providing easy access to shopping, entertainment, and historical landmarks.</p>
    </div>

    <h2>Make a Reservation</h2>

    <% if (isFullyBooked) { %>
        <div class="message">All rooms are booked for this hotel.</div>
    <% } else { %>
        <!-- Reservation Form -->
        <form class="reservation-form" action="reservation1Servlet" method="POST">
            <input type="hidden" id="customerId" name="customerId" value="<%= customerId %>">
            <input type="hidden" id="roomId" name="roomId" value="<%= formattedRoomId %>">
            <input type="hidden" id="hotelId" name="hotelId" value="<%= hotelId %>">
            <input type="hidden" id="priceDisplay" name="priceDisplay" value="10000 - 25000">

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
                <option value="suite">Luxury Suite</option>
            </select>

            <label for="specialRequests">Special Requests:</label>
            <input type="text" id="specialRequests" name="specialRequests">

            <button type="submit">Reserve Now</button>
        </form>
    <% } %>
</div>

</body>
</html>
