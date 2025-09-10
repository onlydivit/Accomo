<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Reservation System</title>
    <style>
        body {
            font-family: 'Georgia', serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
            line-height: 1.6;
        }
        header {
            background-color: #1c3f60;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        header img {
            max-width: 150px;
            margin-bottom: 10px;
        }

        header h1 {
            font-size: 2.5em;
            margin: 0;
            font-weight: normal;
        }

        nav {
            background-color: #2c5c8a;
            display: flex;
            justify-content: center;
            padding: 10px 0;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            margin: 0 5px;
            font-size: 1.1em;
            transition: background-color 0.3s ease;
        }

        nav a:hover {
            background-color: #1c3f60;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        h2 {
            text-align: center;
            color: #1c3f60;
            font-size: 2em;
            margin-bottom: 30px;
        }

        .filters {
            text-align: center;
            margin-bottom: 30px;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .range-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 10px 0;
        }

        input[type="range"] {
            width: 60%;
            margin: 10px 0;
            -webkit-appearance: none;
            height: 6px;
            background: #ddd;
            border-radius: 5px;
        }

        input[type="range"]::-webkit-slider-thumb {
            -webkit-appearance: none;
            appearance: none;
            width: 15px;
            height: 15px;
            border-radius: 50%;
            background: #2c5c8a;
            cursor: pointer;
        }

        input[type="range"]::-moz-range-thumb {
            width: 15px;
            height: 15px;
            border-radius: 50%;
            background: #2c5c8a;
            cursor: pointer;
        }

        input[type="range"]:focus {
            outline: none;
        }

        .hotel-list {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: space-around;
        }

        .hotel-card {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .hotel-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .hotel-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .hotel-card h3 {
            color: #1c3f60;
            margin: 20px 15px 10px;
            font-size: 1.4em;
        }

        .hotel-card p {
            padding: 0 15px;
            color: #666;
            font-size: 0.9em;
            height: 60px;
            overflow: hidden;
        }

        .hotel-card a {
            display: block;
            background-color: #2c5c8a;
            color: white;
            padding: 12px;
            text-decoration: none;
            margin: 15px;
            border-radius: 4px;
            text-align: center;
            transition: background-color 0.3s ease;
            font-weight: bold;
        }

        .hotel-card a:hover {
            background-color: #1c3f60;
        }
    </style>
    <script>
        let minPrice = 10000;
        let maxPrice = 50000;

        function filterHotels() {
            const category = document.getElementById('categoryFilter').value.toLowerCase();
            const hotels = document.querySelectorAll('.hotel-card');
            
            hotels.forEach(hotel => {
                const hotelCategory = hotel.getAttribute('data-category').toLowerCase();
                const hotelPrice = parseFloat(hotel.getAttribute('data-price'));
                const categoryMatch = (category === 'all' || hotelCategory.includes(category));
                const priceMatch = hotelPrice >= minPrice && hotelPrice <= maxPrice;

                hotel.style.display = (categoryMatch && priceMatch) ? 'block' : 'none';
            });
        }

        function sortHotels() {
            const sortOption = document.getElementById('sortFilter').value;
            const hotelList = document.querySelector('.hotel-list');
            const hotels = Array.from(hotelList.querySelectorAll('.hotel-card'));

            hotels.sort((a, b) => {
                if (sortOption === 'price') {
                    return parseFloat(a.getAttribute('data-price')) - parseFloat(b.getAttribute('data-price'));
                } else if (sortOption === 'rating') {
                    return parseFloat(b.getAttribute('data-rating')) - parseFloat(a.getAttribute('data-rating'));
                }
            });

            hotels.forEach(hotel => hotelList.appendChild(hotel));
        }

        function updatePriceRange() {
            const rangeSlider = document.getElementById('priceRange');
            minPrice = parseFloat(rangeSlider.value);
            document.getElementById('minPriceValue').textContent = minPrice;
            document.getElementById('maxPriceValue').textContent = maxPrice;
            filterHotels();
        }
    </script>
</head>
<body>
<header>
    <img src="images/accomo.jpg" alt="Hotel Logo">
    <h1>Stay at Ease</h1>
</header>
<nav>
    <a href="index.jsp">Home</a>
    <a href="contact.jsp">Contact Us</a>
    <a href="Login.jsp">Login</a>
     <a href="Reservation.jsp">Reservation</a>
</nav>
<div class="container">
    <h2>Choose Your Hotel</h2>
    <!-- Filter and Sort Section -->
    <div class="filters">
        <label for="categoryFilter">Filter by Category:</label>
        <select id="categoryFilter" onchange="filterHotels()">
            <option value="all">All</option>
            <option value="beach">Beach</option>
            <option value="city">City</option>
            <option value="mountain">Mountain</option>
            <option value="luxury">Luxury</option>
        </select>

        <div class="range-container">
            <label for="priceRange">Price Range: <span id="minPriceValue">10000</span> - <span id="maxPriceValue">50000</span></label>
            <input type="range" id="priceRange" min="10000" max="50000" value="10000" step="5000" 
                   oninput="updatePriceRange()" />
        </div>

        <label for="sortFilter">Sort by:</label>
        <select id="sortFilter" onchange="sortHotels()">
            <option value="price">Price</option>
            <option value="rating">Rating</option>
        </select>
    </div>

    <!-- Hotel List -->
    <div class="hotel-list">

    <!-- Hotel 1 (already included earlier) -->
    <div class="hotel-card" data-category="city" data-price="20000" data-rating="4.5">
        <img src="images/hotel1.jpg" alt="Hotel 1">
        <h3>Hotel Grand Palace</h3>
        <p>Located in the heart of the city with luxury amenities and scenic views.</p>
        <p><strong>Price Range:</strong> ₹15,000 - ₹20,000</p>
        <a href="reservations1.jsp?hotel=Hotel Grand Palace">Reserve Now</a>
    </div>

    <!-- Hotel 2 -->
    <div class="hotel-card" data-category="beach" data-price="45000" data-rating="4.2">
        <img src="images/hotel2.jpg" alt="Hotel 2">
        <h3>Sunny Beach Resort</h3>
        <p>Enjoy your stay by the beach with relaxing sunbeds and beautiful sunsets.</p>
        <p><strong>Price Range:</strong> ₹45,000 - ₹50,000</p>
        <a href="reservations2.jsp?hotel=Sunny Beach Resort">Reserve Now</a>
    </div>

    <!-- Hotel 3 -->
    <div class="hotel-card" data-category="mountain" data-price="35000" data-rating="4.0">
        <img src="images/hotel3.jpg" alt="Hotel 3">
        <h3>Mountain Escape Lodge</h3>
        <p>Get away from it all and relax in the mountains surrounded by nature.</p>
        <p><strong>Price Range:</strong> ₹35,000 - ₹40,000</p>
        <a href="reservations3.jsp?hotel=Mountain Escape Lodge">Reserve Now</a>
    </div>

    <!-- Hotel 4 -->
    <div class="hotel-card" data-category="mountain" data-price="15000" data-rating="4.6">
        <img src="images/hotel4.jpg" alt="Hotel 4">
        <h3>Mountain View Retreat</h3>
        <p>Perfect for business travelers looking for convenience and comfort in the city.</p>
        <p><strong>Price Range:</strong> ₹10,000 - ₹15,000</p>
        <a href="reservations4.jsp?hotel=Mountain View Retreat">Reserve Now</a>
    </div>

    <!-- Hotel 5 -->
    <div class="hotel-card" data-category="lake" data-price="40000" data-rating="4.3">
        <img src="images/hotel5.jpg" alt="Hotel 5">
        <h3>Lakeside Paradise Inn</h3>
        <p>A peaceful retreat by the lake with stunning views and tranquil surroundings.</p>
        <p><strong>Price Range:</strong> ₹40,000 - ₹45,000</p>
        <a href="reservations5.jsp?hotel=Lakeside Paradise Inn">Reserve Now</a>
    </div>

    <!-- Hotel 6 -->
    <div class="hotel-card" data-category="luxury" data-price="45000" data-rating="4.9">
        <img src="images/hotel6.jpg" alt="Hotel 6">
        <h3>Luxury Royal Hotel</h3>
        <p>Experience royal treatment in our luxurious and elegant hotel.</p>
        <p><strong>Price Range:</strong> ₹45,000 - ₹50,000</p>
        <a href="reservations6.jsp?hotel=Luxury Royal Hotel">Reserve Now</a>
    </div>

    <!-- Hotel 7 -->
    <div class="hotel-card" data-category="city" data-price="25000" data-rating="3.9">
        <img src="images/hotel7.jpg" alt="Hotel 7">
        <h3>City Central Plaza</h3>
        <p>A modern hotel situated in the vibrant downtown area with easy access to attractions.</p>
        <p><strong>Price Range:</strong> ₹25,000 - ₹30,000</p>
        <a href="reservations7.jsp?hotel=City Central Plaza">Reserve Now</a>
    </div>

    <!-- Hotel 8 -->
    <div class="hotel-card" data-category="mountain" data-price="30000" data-rating="4.1">
        <img src="images/hotel8.jpg" alt="Hotel 8">
        <h3>Hilltop Haven Resort</h3>
        <p>Relax in our mountain-view hotel with access to hiking trails and scenic landscapes.</p>
        <p><strong>Price Range:</strong> ₹30,000 - ₹35,000</p>
        <a href="reservations8.jsp?hotel=Hilltop Haven Resort">Reserve Now</a>
    </div>

    <!-- Hotel 9 -->
    <div class="hotel-card" data-category="beach" data-price="35000" data-rating="4.7">
        <img src="images/hotel9.jpg" alt="Hotel 9">
        <h3>Oceanfront Paradise</h3>
        <p>Enjoy breathtaking ocean views from every room and world-class dining options.</p>
        <p><strong>Price Range:</strong> ₹35,000 - ₹40,000</p>
        <a href="reservations9.jsp?hotel=Oceanfront Paradise">Reserve Now</a>
    </div>

    <!-- Hotel 10 -->
    <div class="hotel-card" data-category="luxury" data-price="15000" data-rating="5.0">
        <img src="images/hotel10.jpg" alt="Hotel 10">
        <h3>Trident</h3>
        <p>Stay in the epitome of luxury and sophistication, with exclusive services and amenities.</p>
        <p><strong>Price Range:</strong> ₹10,000 - ₹15,000</p>
        <a href="reservations10.jsp?hotel=Trident">Reserve Now</a>
    </div>
</div>
    </div>
</body>
</html>