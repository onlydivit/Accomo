<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register/Login - Hotel Reservation System</title>  
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
            max-width: 400px;
            margin: 50px auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        input[type="text"], input[type="email"], input[type="password"], input[type="tel"], input[type="submit"] {
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
        .error {
            color: red;
            text-align: center;
        }
        .tab {
            overflow: hidden;
            margin-bottom: 20px;
        }
        .tab button {
            float: left;
            background-color: #f4f4f4;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 10px 20px;
            font-size: 16px;
        }
        .tab button:hover {
            background-color: #ddd;
        }
        .tab button.active {
            background-color: #ccc;
        }
        .form-content {
            display: none;
        }
        .form-content.active {
            display: block;
        }  
    </style>
    <script>
        function openForm(evt, formName) {
            var i, formContent, tablinks;
            formContent = document.getElementsByClassName("form-content");
            for (i = 0; i < formContent.length; i++) {
                formContent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(formName).style.display = "block";
            evt.currentTarget.className += " active";
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
</nav>

<div class="container">
    <div class="tab">
        <button class="tablinks active" onclick="openForm(event, 'SignUp')">Sign Up</button>
        <button class="tablinks" onclick="openForm(event, 'Login')">Login</button>
    </div>

    <!-- Display error message if registration or login fails -->
    <%
        String errorMessage = request.getParameter("error");
        if (errorMessage != null) {
    %>
        <p class="error"><%= errorMessage %></p>
    <%
        }
    %>

    <!-- Sign Up form -->
    <div id="SignUp" class="form-content active">
        <h2>Register an Account</h2>
        <form action="LoginServlet" method="post">
            <input type="hidden" name="action" value="signup">
            
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName" placeholder="Enter your first name" required>

            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName" placeholder="Enter your last name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>

            <input type="submit" value="Register">
        </form>
    </div>

    <!-- Login form -->
    <div id="Login" class="form-content">
        <h2>Login to Your Account</h2>
        <form action="LoginServlet" method="post">
            <input type="hidden" name="action" value="login">

            <label for="loginEmail">Email:</label>
            <input type="email" id="loginEmail" name="email" placeholder="Enter your email" required>

            <label for="loginPassword">Password:</label>
            <input type="password" id="loginPassword" name="password" placeholder="Enter your password" required>

            <input type="submit" value="Login">
        </form>
    </div>
</div>

<script>
    // Default open tab
    document.getElementById("SignUp").style.display = "block";
</script>

</body>
</html>
