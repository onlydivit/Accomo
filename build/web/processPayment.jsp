<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Processing - Hotel Reservation System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
        }
        .success {
            color: green;
        }
        .error {
            color: red;
        }
        .button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #5cb85c;
            color: white;
            border: none;
            cursor: pointer;
            text-decoration: none;
        }
        .button:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Payment Processing</h2>

    <%
        String paymentMethod = request.getParameter("paymentMethod");
        String reservationId = request.getParameter("reservationId");
        String amount = request.getParameter("amount");
        boolean paymentSuccess = false;

        // Process payment based on the selected payment method
        if ("UPI".equals(paymentMethod)) {
            String upiId = request.getParameter("upiId");
            if (upiId != null && !upiId.isEmpty()) {
                paymentSuccess = true; // Simulate success for valid UPI ID
            }
        } else if ("QRScanner".equals(paymentMethod)) {
            paymentSuccess = true; // Simulate success for QR code scan
        } else if ("DebitCard".equals(paymentMethod) || "CreditCard".equals(paymentMethod)) {
            String cardName = request.getParameter("cardName");
            String cardNumber = request.getParameter("cardNumber");
            String expiryDate = request.getParameter("expiryDate");
            String cvv = request.getParameter("cvv");
            if (cardName != null && !cardName.isEmpty() && cardNumber != null && cardNumber.length() == 16
                && expiryDate != null && expiryDate.matches("\\d{2}/\\d{2}") && cvv != null && cvv.length() == 3) {
                paymentSuccess = true; // Simulate success for valid card details
            }
        }

        if (paymentSuccess) {
    %>
        <p class="success">Payment of Rs<%= amount %> for Reservation ID <%= reservationId %> was successful!</p>
        <a href="Reservation.jsp" class="button">Return to Reservations</a>
    <%
        } else {
    %>
        <p class="error">Payment failed. Please try again.</p>
        <a href="Payment.jsp?reservationId=<%= reservationId %>" class="button">Go Back to Payment</a>
    <%
        }
    %>
</div>

</body>
</html>