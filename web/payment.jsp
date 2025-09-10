<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment - Hotel Reservation System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #333;
            color: white;
            padding: 15px;
            text-align: center;
        }
        nav {
            background-color: #444;
            overflow: hidden;
        }
        nav a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }
        nav a:hover {
            background-color: #ddd;
            color: black;
        }
        .container {
            padding: 20px;
            max-width: 600px;
            margin: 50px auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input[type="text"], input[type="number"], input[type="submit"], select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            background-color: #5cb85c;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #4cae4c;
        }
        .hidden {
            display: none;
        }
        .qr-image {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .qr-image img {
            width: 250px;
            height: 250px;
        }
        .reservation-info {
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
        }
    </style>
    <script>
        // Function to change the interface based on selected payment method
        function updatePaymentFields() {
            var paymentMethod = document.getElementById('paymentMethod').value;
            var cardDetails = document.getElementById('cardDetails');
            var upiField = document.getElementById('upiField');
            var scannerField = document.getElementById('scannerField');

            // Hide all fields first
            cardDetails.classList.add('hidden');
            upiField.classList.add('hidden');
            scannerField.classList.add('hidden');

            // Show the fields based on the selected payment method
            if (paymentMethod === 'DebitCard' || paymentMethod === 'CreditCard') {
                cardDetails.classList.remove('hidden');
            } else if (paymentMethod === 'UPI') {
                upiField.classList.remove('hidden');
            } else if (paymentMethod === 'QRScanner') {
                scannerField.classList.remove('hidden');
            }
        }
    </script>
</head>
<body>

<header>
    <h1>Hotel Reservation System</h1>
</header>

<nav>
    <a href="index.jsp">Home</a>
    <a href="contact.jsp">Contact Us</a>
    <a href="login.jsp">Login</a>
</nav>

<div class="container">
    <h2>Payment Details</h2>
    
    <form action="processPayment.jsp" method="post">
        <!-- Dropdown for Payment Method -->
        <label for="paymentMethod">Select Payment Method:</label>
        <select id="paymentMethod" name="paymentMethod" onchange="updatePaymentFields()" required>
            <option value="" disabled selected>Select Payment Method</option>
            <option value="UPI">UPI</option>
            <option value="QRScanner">QR Scanner</option>
            <option value="DebitCard">Debit Card</option>
            <option value="CreditCard">Credit Card</option>
        </select>

        <!-- UPI Payment Field -->
        <div id="upiField" class="hidden">
            <label for="upiId">Enter UPI ID:</label>
            <input type="text" id="upiId" name="upiId" placeholder="Enter your UPI ID">
        </div>

        <!-- QR Scanner Payment Field -->
        <div id="scannerField" class="hidden">
            <label for="qrCode">Scan QR Code to Pay:</label>
            <div class="qr-image">
                <!-- Display the provided QR code image -->
                <img src="images/Upi.jpg" alt="UPI QR Code">
            </div>
        </div>

        <!-- Card Details (for Credit/Debit Card payments) -->
        <div id="cardDetails" class="hidden">
            <label for="name">Cardholder Name:</label>
            <input type="text" id="name" name="cardName" placeholder="Enter cardholder name">
            
            <label for="cardNumber">Card Number:</label>
            <input type="text" id="cardNumber" name="cardNumber" placeholder="Enter your card number" pattern="\\d{16}" title="Card number must be 16 digits">

            <label for="expiry">Expiry Date (MM/YY):</label>
            <input type="text" id="expiry" name="expiryDate" placeholder="MM/YY" pattern="\\d{2}/\\d{2}" title="Expiry date format should be MM/YY">

            <label for="cvv">CVV:</label>
            <input type="text" id="cvv" name="cvv" placeholder="Enter CVV" pattern="\\d{3}" title="CVV must be 3 digits">
        </div>

        <!-- Calculate total price from priceDisplay -->
        <%
            String priceDisplay = request.getParameter("priceDisplay");
            String[] prices = priceDisplay != null ? priceDisplay.split(" - ") : new String[]{"30000", "35000"};
            double minPrice = Double.parseDouble(prices[0]);
            double maxPrice = Double.parseDouble(prices[1]);

            int nights = Integer.parseInt(request.getParameter("nights") != null ? request.getParameter("nights") : "1");
            double totalAmount = ((minPrice + maxPrice) / 2) * nights;
        %>
        
        <label for="amount">Amount to Pay:</label>
        <input type="number" id="amount" name="amount" value="<%= totalAmount %>" readonly>

        <input type="submit" value="Proceed to Pay">
    </form>
</div>

</body>
</html>
