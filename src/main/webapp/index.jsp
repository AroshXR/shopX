<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>ShopX | Landing Page</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>

<header class="landing-navbar">
    <div class="landing-logo">Shop <span class="logo-x">X</span></div>
    <button class="landing-btn-dashboard" onclick="location.href='homePage.jsp'">
        <i class='bx bxs-dashboard'></i> Dashboard
    </button>
</header>

<main class="landing-hero">
    <h1>Welcome to ShopX</h1>
    <p>Your curated destination for thoughtful gifts, seasonal treats, and more.</p>
    <button class="landing-start-btn" onclick="location.href='homePage.jsp'">
        <i class='bx bx-store'></i> Start Shopping
    </button>
</main>

<section class="landing-why-choose">
    <h2>Why Shop with Us?</h2>
    <div class="reasons-grid">
        <div class="reason-card">
            <i class='bx bxs-gift'></i>
            <h3>Unique Gifts</h3>
            <p>Curated selections for every occasion.</p>
        </div>
        <div class="reason-card">
            <i class='bx bx-shield-quarter'></i>
            <h3>Secure Checkout</h3>
            <p>Shop with peace of mind.</p>
        </div>
        <div class="reason-card">
            <i class='bx bx-leaf'></i>
            <h3>Sustainable</h3>
            <p>Eco-friendly packaging & practices.</p>
        </div>
    </div>
</section>


<footer class="landing-footer">
    <div class="landing-footer-content">
        <div class="landing-footer-logo">ShopX</div>
        <div class="landing-footer-links">
            <a href="#">About</a>
            <a href="#">Contact</a>
            <a href="#">Privacy</a>
            <a href="#">Terms</a>
        </div>
        <p class="landing-footer-copy">&copy; 2025 ShopX. All rights reserved.</p>
    </div>
</footer>

</body>
</html>
