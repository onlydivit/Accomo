<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation Confirmation - Grand Palace Hotel</title>
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
        h1 {
            text-align: center;
            color: #5cb85c;
        }
        .details {
            margin-bottom: 30px;
        }
        p {
            font-size: 18px;
            line-height: 1.6;
        }
        .highlight {
            font-weight: bold;
            color: #333;
        }
        .reservation-id {
            margin-top: 20px;
            font-size: 24px;
            color: #5cb85c;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #5cb85c;
            color: white;
            text-decoration: none;
            margin-top: 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>

<%
    // Retrieve reservation details from form submission
    String customerId = request.getParameter("customerId");
    String roomId = request.getParameter("roomId");
    String hotelId = request.getParameter("hotelId");
    String checkinDate = request.getParameter("checkin");
    String checkoutDate = request.getParameter("checkout");
    String guests = request.getParameter("guests");
    String roomType = request.getParameter("roomType");
    String specialRequests = request.getParameter("specialRequests");

    // Create a reservation ID by combining customerId and roomId
    String reservationId = "RES" + customerId + roomId;
%>

<div class="container">
    <h1>Reservation Confirmed!</h1>

    <div class="details">
        <p>Thank you for choosing the Grand Palace Hotel! Your reservation has been successfully confirmed.</p>
        <p><strong class="highlight">Reservation ID:</strong> <span class="reservation-id"><%= reservationId %></span></p>
        <p><strong class="highlight">Customer ID:</strong> <%= customerId %></p>
        <p><strong class="highlight">Hotel ID:</strong> <%= hotelId %></p>
        <p><strong class="highlight">Room ID:</strong> <%= roomId %></p>
        <p><strong class="highlight">Check-in Date:</strong> <%= checkinDate %></p>
        <p><strong class="highlight">Check-out Date:</strong> <%= checkoutDate %></p>
        <p><strong class="highlight">Number of Guests:</strong> <%= guests %></p>
        <p><strong class="highlight">Room Type:</strong> <%= roomType %></p>
        <p><strong class="highlight">Special Requests:</strong> <%= (specialRequests == null || specialRequests.isEmpty()) ? "None" : specialRequests %></p>
    </div>

    <a class="button" href="payment.jsp">procced payment</a>
</div>

</body>
</html>