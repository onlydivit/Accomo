<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Hotel Reservation System</title>
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
            padding: 15px 0;
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
            max-width: 800px;
            margin: 0 auto;
        }
        h1 {
            text-align: center;
            margin-bottom: 40px;
        }
        .contact-form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        input[type="text"], input[type="email"], textarea, input[type="submit"] {
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
    </style>
</head>
<body>

<header>
    <h1>Contact Us</h1>
</header>

<nav>
    <a href="index.jsp">Home</a>
    <a href="contact.jsp">Contact Us</a>
    <a href="login.jsp">Login</a>
</nav>

<div class="container">
    <h2>Get in Touch</h2>
    <p>If you have any questions, feedback, or issues, feel free to reach out to us using the form below. We'll get back to you as soon as possible.</p>
    
    <div class="contact-form">
        <form action="index.jsp" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" placeholder="Your full name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Your email address" required>

            <label for="subject">Subject:</label>
            <input type="text" id="subject" name="subject" placeholder="Subject of your message" required>

            <label for="message">Message:</label>
            <textarea id="message" name="message" rows="5" placeholder="Write your message here..." required></textarea>

            <input type="submit" value="Send Message">
        </form>
    </div>
</div>

</body>
</html>
