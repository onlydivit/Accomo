<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation</title>
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
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .confirm-msg, .cancel-section {
            background-color: #f2f2f2;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 8px;
            text-align: center;
        }
        .confirm-btn, .cancel-btn {
            padding: 10px 20px;
            margin-top: 20px;
            border: none;
            cursor: pointer;
        }
        .confirm-btn {
            background-color: #5cb85c;
            color: white;
        }
        .confirm-btn:hover {
            background-color: #4cae4c;
        }
        .cancel-btn {
            background-color: #d9534f;
            color: white;
        }
        .cancel-btn:hover {
            background-color: #c9302c;
        }
        .success-msg {
            color: green;
            text-align: center;
            font-weight: bold;
        }
        .home-link {
            display: block;
            margin: 20px 0;
            text-align: center;
        }
        .home-link a {
            color: #333;
            text-decoration: none;
            font-weight: bold;
        }
        .home-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Reservation</h1>

    <%
        String reservationId = request.getParameter("reservationId");
        String confirmCancel = request.getParameter("confirmCancel");
        
        // Check if a reservation cancellation has been confirmed
        if ("yes".equals(confirmCancel) && reservationId != null) {
            out.println("<p class='success-msg'>Reservation ID " + reservationId + " has been successfully canceled.</p>");
        } else if (reservationId != null) {
            // Mock reservation details for the selected reservation
            String hotel = "Desert Oasis Resort";  // Assume these are the selected reservation details
            String checkin = "2024-11-01";
            String checkout = "2024-11-05";
            String guests = "2";
            String roomType = "Luxury Suite";
    %>

        <!-- Cancel Confirmation Section -->
        <div class="confirm-msg">
            <p>Are you sure you want to cancel the following reservation?</p>
            <p><strong>Reservation ID:</strong> <%= reservationId %></p>
            <p><strong>Hotel:</strong> <%= hotel %></p>
            <p><strong>Check-in Date:</strong> <%= checkin %></p>
            <p><strong>Check-out Date:</strong> <%= checkout %></p>
            <p><strong>Number of Guests:</strong> <%= guests %></p>
            <p><strong>Room Type:</strong> <%= roomType %></p>
        </div>

        <!-- Form to confirm cancellation -->
        <form action="Reservation.jsp" method="GET">
            <input type="hidden" name="reservationId" value="<%= reservationId %>">
            <input type="hidden" name="confirmCancel" value="yes">
            <button type="submit" class="confirm-btn">Yes, Cancel Reservation</button>
            <button type="button" class="cancel-btn" onclick="window.location.href='Reservation.jsp'">No, Go Back</button>
        </form>

    <%
        } else {
            // Mock data for reservations (in a real scenario, fetch from database or session)
            List<String[]> reservations = new ArrayList<>();
            reservations.add(new String[]{"1", "Desert Oasis Resort", "2024-11-01", "2024-11-05", "2", "Luxury Suite"});
            reservations.add(new String[]{"2", "Forest Cabin Hideaway", "2024-12-10", "2024-12-15", "4", "Deluxe Cabin"});
            reservations.add(new String[]{"3", "Riverfront Paradise", "2024-10-28", "2024-10-31", "3", "Riverside Suite"});
    %>

        <!-- Reservation History Section -->
        <table>
            <thead>
                <tr>
                    <th>Reservation ID</th>
                    <th>Hotel</th>
                    <th>Check-in</th>
                    <th>Check-out</th>
                    <th>Guests</th>
                    <th>Room Type</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (reservations.isEmpty()) {
                        out.println("<tr><td colspan='7' style='text-align:center;'>No reservations found.</td></tr>");
                    } else {
                        for (String[] reservation : reservations) {
                %>
                <tr>
                    <td><%= reservation[0] %></td>
                    <td><%= reservation[1] %></td>
                    <td><%= reservation[2] %></td>
                    <td><%= reservation[3] %></td>
                    <td><%= reservation[4] %></td>
                    <td><%= reservation[5] %></td>
                    <td>
                        <form action="Reservation.jsp" method="GET">
                            <input type="hidden" name="reservationId" value="<%= reservation[0] %>">
                            <button type="submit" class="cancel-btn">Cancel</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>

    <%
        }
    %>

    <div class="home-link">
        <a href="index.jsp">Return to Home</a>
    </div>
</div>

</body>
</html>
