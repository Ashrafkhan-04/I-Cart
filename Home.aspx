
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>I-Cart</title>
    <link href="https://fonts.googleapis.com/css2?family=Amazon+Ember:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* Color Palette & Font Variables */
:root {
    --amazon-blue: #131921;
    --amazon-light-blue: #232F3E;
    --amazon-orange: #FEBD69;
    --amazon-gold: #FF9900;
    --amazon-grey: #EAEDED;
    --text-color-dark: #111;
    --text-color-light: #565959;
    --white-color: #fff;
    --border-color: #D5D9D9;
}

/* Base Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Amazon Ember', Roboto, Arial, sans-serif; /* Fallback fonts */
}

body {
    background-color: var(--amazon-grey);
    color: var(--text-color-dark);
    line-height: 1.6;
}

.container {
    max-width: 1500px;
    margin: 0 auto;
    padding: 20px;
}

a {
    text-decoration: none;
    color: var(--amazon-blue);
    transition: color 0.2s ease;
}

a:hover {
    text-decoration: underline;
}

ul {
    list-style: none;
}

button {
    cursor: pointer;
    border: none;
    background: transparent;
    padding: 0;
}

/* Header - Top Navigation */
.top-nav {
    background-color: var(--amazon-blue);
    color: var(--white-color);
    display: flex;
    align-items: center;
    padding: 8px 20px;
    min-height: 60px;
    flex-wrap: wrap; /* Allows wrapping on smaller screens */
    gap: 10px;
}

.nav-left, .nav-right {
    display: flex;
    align-items: center;
    gap: 15px;
}

.nav-left .logo img {
    height: 30px; /* Amazon logo height */
    margin-right: 10px;
}

.location-picker {
    display: flex;
    flex-direction: column;
    font-size: 0.8rem;
    line-height: 1.2;
    cursor: pointer;
}

.location-picker span {
    font-size: 1rem;
}

.location-picker:hover {
    outline: 1px solid var(--white-color);
    border-radius: 2px;
}

.nav-search {
    flex-grow: 1;
    display: flex;
    max-width: 800px;
    margin: 0 10px;
    height: 40px;
    border-radius: 4px;
    overflow: hidden;
}

.nav-search input {
    flex-grow: 1;
    border: none;
    padding: 10px;
    font-size: 1rem;
    outline: none;
}

.nav-search button {
    background-color: white;
    padding: 0 15px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.nav-search button img {
    height: 22px;
    width: 22px;
}

.nav-search button:hover {
    background-color: white;
}

.nav-item {
    display: flex;
    align-items: center;
    gap: 15px;
    cursor: pointer;
    font-size: 0.85rem;
    padding: 10px 2px; /* For hover effect outline */
    border: 1px solid transparent; /* For hover effect outline */
    border-radius: 2px;
}

.nav-item:hover {
    border-color: var(--white-color);
}

.nav-item img {
    height: 25px;
    width: 25px;
}

.nav-item.account span {
    white-space: nowrap; /* Prevent "Account & Lists" from wrapping */
}

.cart-icon {
    position: relative;
    font-weight: 700;
}

.cart-icon #cart-count {
    position: absolute;
    top: 5px;
    left: 20px;
    background-color: var(--amazon-orange);
    color: var(--text-color-dark);
    font-size: 0.75rem;
    font-weight: 700;
    border-radius: 50%;
    padding: 2px 6px;
    min-width: 20px;
    text-align: center;
}

.hamburger-menu {
    display: none; /* Hidden by default on desktop */
    flex-direction: column;
    gap: 4px;
    cursor: pointer;
    padding: 5px;
    border: 1px solid transparent;
    border-radius: 3px;
}

.hamburger-menu:hover {
    border-color: var(--white-color);
}

.hamburger-menu span {
    display: block;
    width: 25px;
    height: 3px;
    background-color: var(--white-color);
}


/* Sub Navigation */
.sub-nav {
    background-color: var(--amazon-light-blue);
    color: var(--white-color);
    padding: 8px 20px;
}

.sub-nav-links {
    display: flex;
    gap: 20px;
    flex-wrap: wrap; /* Allows wrapping */
}

.sub-nav-links li a {
    color: var(--white-color);
    font-size: 0.9rem;
    white-space: nowrap;
    padding: 5px 8px;
    border: 1px solid transparent;
    border-radius: 2px;
}

.sub-nav-links li a:hover {
    border-color: var(--white-color);
    text-decoration: none;
}

/* Hero Carousel */
.hero-carousel {
    position: relative;
    max-width: 100%;
    overflow: hidden;
    margin-bottom: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.carousel-inner {
    display: flex;
    transition: transform 0.5s ease-in-out;
}

.carousel-item {
    width: 100%;
    display: none; /* Hidden by default */
    flex-shrink: 0;
    object-fit: cover;
    height: 350px; /* Adjust height as needed */
}

.carousel-item.active {
    display: block;
}

.carousel-prev, .carousel-next {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background-color: rgba(0,0,0,0.5);
    color: var(--white-color);
    border: none;
    padding: 10px 15px;
    font-size: 2rem;
    cursor: pointer;
    z-index: 10;
    transition: background-color 0.3s ease;
}

.carousel-prev:hover, .carousel-next:hover {
    background-color: rgba(0,0,0,0.7);
}

.carousel-prev {
    left: 0;
    border-top-right-radius: 8px;
    border-bottom-right-radius: 8px;
}

.carousel-next {
    right: 0;
    border-top-left-radius: 8px;
    border-bottom-left-radius: 8px;
}

/* Category Cards Section */
.category-cards-section {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 20px;
    margin-bottom: 30px;
}

.category-card {
    background-color: var(--white-color);
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
    text-align: center;
    display: flex;
    flex-direction: column;
    align-items: center;
    transition: transform 0.2s ease;
}

.category-card:hover {
    transform: translateY(-3px);
}

.category-card h3 {
    font-size: 1.5rem;
    margin-bottom: 15px;
}

.category-card img {
    max-width: 100%;
    height: 180px;
    object-fit: contain;
    margin-bottom: 15px;
}

/* Promotional Banners */
.promotional-banners {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
    gap: 20px;
    margin-bottom: 30px;
}

.promotional-banners img {
    width: 100%;
    height: auto;
    border-radius: 8px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
    transition: transform 0.2s ease;
}

.promotional-banners img:hover {
    transform: translateY(-3px);
}

/* Product Listing Section */
.product-listing-section h2 {
    font-size: 2rem;
    margin-bottom: 20px;
    text-align: center;
}

.product-filters {
    display: flex;
    justify-content: center;
    gap: 15px;
    margin-bottom: 25px;
    flex-wrap: wrap;
}

.product-filters select,
.product-filters input {
    padding: 8px 12px;
    border: 1px solid var(--border-color);
    border-radius: 4px;
    font-size: 1rem;
    min-width: 180px;
}

.product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
}

.product-card-listing {
    background-color: var(--white-color);
    padding: 15px;
    border-radius: 8px;
    box-shadow: 0 1px 3px rgba[0,0,0,0.08];
    text-align: center;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    transition: box-shadow 0.2s ease, transform 0.2s ease;
}

.product-card-listing:hover {
    box-shadow: 0 4px 8px rgba(0,0,0,0.15);
    transform: translateY(-2px);
}

.product-card-listing img {
    max-width: 100%;
    height: 160px;
    object-fit: contain;
    margin-bottom: 10px;
}

.product-card-listing h3 {
    font-size: 1.1rem;
    margin-bottom: 8px;
    color: var(--text-color-dark);
    text-align: left;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
}

.product-card-listing .price {
    font-size: 1.3rem;
    font-weight: 700;
    color: var(--text-color-dark);
    margin-bottom: 10px;
    text-align: left;
}

.product-card-listing .add-to-cart-btn {
    background-color: var(--amazon-orange);
    color: var(--text-color-dark);
    padding: 8px 15px;
    border-radius: 20px;
    font-size: 0.9rem;
    font-weight: 700;
    transition: background-color 0.2s ease;
    align-self: flex-start; /* Aligns button to the left */
}

.product-card-listing .add-to-cart-btn:hover {
    background-color: var(--amazon-gold);
}

/* Shopping Cart Sidebar */
.cart-sidebar {
    position: fixed;
    top: 0;
    right: -450px; /* Hidden by default */
    width: 400px;
    max-width: 90%;
    height: 100%;
    background-color: var(--white-color);
    box-shadow: -5px 0 15px rgba(0,0,0,0.2);
    z-index: 1100;
    display: flex;
    flex-direction: column;
    transition: right 0.3s ease-in-out;
}

.cart-sidebar.open {
    right: 0;
}

.cart-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 20px;
    border-bottom: 1px solid var(--border-color);
    background-color: var(--amazon-blue);
    color: var(--white-color);
}

.cart-header h3 {
    font-size: 1.6rem;
    margin: 0;
}

.close-cart {
    font-size: 2rem;
    color: var(--white-color);
    cursor: pointer;
    line-height: 1;
}

.close-cart:hover {
    color: var(--amazon-orange);
}

.cart-items {
    flex-grow: 1;
    padding: 20px;
    overflow-y: auto;
}

.cart-item {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
    padding-bottom: 15px;
    border-bottom: 1px solid var(--amazon-grey);
}

.cart-item:last-child {
    border-bottom: none;
}

.cart-item img {
    width: 80px;
    height: 80px;
    object-fit: contain;
    margin-right: 15px;
    border: 1px solid var(--border-color);
    border-radius: 4px;
}

.item-details {
    flex-grow: 1;
}

.item-details h4 {
    font-size: 1rem;
    margin-bottom: 5px;
    color: var(--text-color-dark);
}

.item-details .price {
    font-weight: 700;
    color: var(--text-color-dark);
    margin-bottom: 8px;
}

.item-quantity-controls {
    display: flex;
    align-items: center;
    gap: 8px;
}

.item-quantity-controls button {
    background-color: var(--amazon-grey);
    border: 1px solid var(--border-color);
    width: 28px;
    height: 28px;
    border-radius: 4px;
    font-size: 1.1rem;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: background-color 0.2s ease;
}

.item-quantity-controls button:hover {
    background-color: #e0e0e0;
}

.item-quantity-controls span {
    font-weight: 500;
}

.remove-item-btn {
    background-color: #f0f0f0;
    color: var(--text-color-light);
    font-size: 0.8rem;
    padding: 4px 8px;
    border-radius: 4px;
    margin-left: 10px;
    border: 1px solid var(--border-color);
    transition: background-color 0.2s ease;
}

.remove-item-btn:hover {
    background-color: #e0e0e0;
    color: var(--text-color-dark);
}

.cart-summary {
    padding: 20px;
    border-top: 1px solid var(--border-color);
    background-color: var(--white-color);
    text-align: right;
}

.cart-summary p {
    font-size: 1.4rem;
    font-weight: 700;
    margin-bottom: 15px;
}

 .proceed-to-checkout {
            display: block;
            background-color: #ffd814;
            color: black;
            padding: 10px;
            text-align: center;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            font-size: 16px;
        }
        .proceed-to-checkout:hover {
            background-color: #ffd820;
        }

/* Footer */
footer {
    background-color: var(--amazon-light-blue);
    color: var(--white-color);
    padding: 30px 20px;
    text-align: center;
    font-size: 0.9rem;
    margin-top: 40px;
}

footer {
    background-color: #f8f8f8;
    padding: 30px 20px;
    font-size: 14px;
    color: #333;
    border-top: 1px solid #ccc;
}

.footer-container {
    max-width: 1000px;
    margin: auto;
    text-align: center;
}

.footer-links a {
    margin: 0 10px;
    color: #0073e6;
    text-decoration: none;
    display: inline-block;
    margin-bottom: 10px;
}

.footer-info span {
    display: block;
    margin-top: 5px;
}

.footer-social {
    margin-top: 15px;
}

.footer-social a img {
    width: 24px;
    height: 24px;
    margin: 0 5px;
    vertical-align: middle;
}

.footer-contact {
    margin-top: 15px;
}

.footer-contact a {
    color: #0073e6;
    text-decoration: none;
}


.footer-links {
    display: flex;
    justify-content: center;
    gap: 20px;
    flex-wrap: wrap;
    margin-bottom: 10px;
}

.footer-links a {
    color: var(--white-color);
    transition: text-decoration 0.2s ease;
}

.footer-links a:hover {
    text-decoration: underline;
}

.sign-in{
    color: var(--white-color);
    font-weight: 700;
    font-size: 0.9rem;
}

/* Mobile Responsiveness */
@media (max-width: 1024px) {
    .nav-search {
        margin: 10px 0;
        width: 100%;
        order: 3; /* Move search bar below nav items on smaller screens */
    }

    .top-nav {
        justify-content: space-between;
    }

    .nav-left, .nav-right {
        gap: 10px;
    }

    .nav-item.account span {
        display: none; /* Hide text on smaller screens */
    }
}

@media (max-width: 768px) {
    .nav-right .nav-item:not(.cart-icon) {
        display: none; /* Hide account icon text on smaller mobile screens */
    }

    .hamburger-menu {
        display: flex; /* Show hamburger on mobile */
    }

    .sub-nav-links {
        flex-direction: column; /* Stack sub-nav links */
        gap: 10px;
        display: none; /* Hidden by default for mobile menu */
    }

    .sub-nav-links.active {
        display: flex; /* Show when active */
    }

    .sub-nav {
        padding: 8px 10px;
    }

    .hero-carousel {
        height: 250px; /* Adjust carousel height for smaller screens */
    }

    .carousel-item {
        height: 250px;
    }

    .category-cards-section, .promotional-banners {
        grid-template-columns: 1fr; /* Single column layout for cards and banners */
    }

    .product-filters {
        flex-direction: column;
        align-items: center;
    }

    .product-filters select,
    .product-filters input {
        width: 100%;
        max-width: 300px; /* Constrain width on mobile */
    }

    .product-grid {
        grid-template-columns: repeat(auto-fit, minmax(180px, 1fr)); /* Smaller cards on small screens */
    }

    .cart-sidebar {
        width: 100%; /* Full width sidebar on very small screens */
    }

    .footer-links {
        flex-direction: column;
        gap: 10px;
    }
}

@media (max-width: 480px) {
    .top-nav {
        padding: 8px 10px;
    }

    .nav-left .logo img {
        height: 25px;
    }

    .location-picker {
        display: none; /* Hide location picker on very small screens */
    }

    .nav-search {
        height: 35px;
    }

    .nav-search input {
        font-size: 0.9rem;
    }

    .nav-item img {
        height: 20px;
        width: 20px;
    }

    .cart-icon #cart-count {
        top: 3px;
        left: 18px;
        font-size: 0.7rem;
        padding: 1px 5px;
        min-width: 18px;
    }

    .product-listing-section h2 {
        font-size: 1.6rem;
    }

    .cart-header h3 {
        font-size: 1.4rem;
    }
}
    </style>
</head>
<body>
    <header class="top-nav">
        <div class="nav-left">
            <h1>I-cart</h1>
            <a href="#" class="logo"><img src="img/cartlogo.jpg" alt="I-Cart Logo"></a>
            <div class="location-picker">
                <p>📌 Deliver to India</p>
            </div>
        </div>
        <div class="nav-search">
            <input type="text" id="search-input" placeholder="Search I-Cart.in">
            <button id="search-button"><img src="img/searchlogo.jpg-removebg-preview.png" alt="Search"></button>
        </div>
        <div class="nav-right">
            <div class="nav-item account">
                <a href="Default.aspx" class="sign-in">Create New Account & Sign in</a>
            </div>
            <div class="nav-item cart-icon">
                <img src="img/cartlogo.jpg" alt="Cart">
                <span id="cart-count">0</span>
                <span>Cart</span>
            </div>
            <div class="hamburger-menu">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
    </header>

    <nav class="sub-nav">
        <ul id="category-filter" class="sub-nav-links">
            <li><a href="#" data-category="all">All</a></li>
            <li><a href="#" data-category="all">Today's Deals</a></li>
            <li><a href="#" data-category="electronics">Electronics</a></li>
            <li><a href="#" data-category="fashion">Fashion</a></li>
            <li><a href="#" data-category="home-kitchen">Home & Kitchen</a></li>
            <li><a href="#" data-category="books">Books</a></li>
        </ul>
    </nav>

    <main class="container">
        <section class="hero-carousel">
            <div class="carousel-inner">
                <img src="img/banner1.jpg" alt="Hero Banner 1" class="carousel-item active">
                <img src="img/banner2.jpg" alt="Hero Banner 2" class="carousel-item">
                <img src="img/banner4.jpg" alt="Hero Banner 3" class="carousel-item">
            </div>
            <button class="carousel-prev">&lt;</button>
            <button class="carousel-next">&gt;</button>
        </section>

        <section class="category-cards-section">
            <div class="category-card">
                <h3>Electronics</h3>
                <img src="img/electronic image.jpg" alt="Electronics">
                <a href="#" data-category="electronics">Shop now</a>
            </div>
            <div class="category-card">
                <h3>Fashion</h3>
                <img src="img/fashion.jpg" alt="Fashion">
                <a href="#" data-category="fashion">Shop now</a>
            </div>
            <div class="category-card">
                <h3>Home & Kitchen</h3>
                <img src="img/homekichene.jpg" alt="Home & Kitchen">
                <a href="#" data-category="home-kitchen">Shop now</a>
            </div>
            <div class="category-card">
               Có h3>Books</h3>
                <img src="img/book2.jpg" alt="Books">
                <a href="#" data-category="books">Shop now</a>
            </div>
        </section>

        <section class="product-listing-section">
            <h2>Today's Deals</h2>
            <div class="product-filters">
                <select id="category-filter">
                    <option value="all">All Categories</option>
                    <option value="electronics">Electronics</option>
                    <option value="fashion">Fashion</option>
                    <option value="home-kitchen">Home & Kitchen</option>
                    <option value="books">Books</option>
                </select>
                <input type="text" id="product-search" placeholder="Search products...">
            </div>
            <div id="product-grid" class="product-grid"></div>
        </section>
    </main>

    <div id="shopping-cart-sidebar" class="cart-sidebar">
        <div class="cart-header">
            <h3>Shopping Cart</h3>
            <span class="close-cart">&times;</span>
        </div>
        <div class="cart-items"></div>
        <div class="cart-summary">
            <p>Subtotal: <span id="cart-total">₹0.00</span></p>
           <a href="Cart.aspx" class="proceed-to-checkout">Proceed to Buy</a>
        </div>
    </div>

    <footer>
    <div class="footer-container">
        <div class="footer-links">
            <a href="#">Conditions of Use & Sale</a>
            <a href="#">Privacy Notice</a>
            <a href="#">Interest-Based Ads</a>
            <a href="#">Help</a>
            <a href="#">Careers</a>
            <a href="#">Contact Us</a>
        </div>

        <div class="footer-info">
            <span>&copy; 1996-2025, I-Cart.com, Inc. or its affiliates. All rights reserved.</span>
            <span>Designed & Developed by <strong>Ashraf Khan</strong></span>
            <span>All trademarks and brands are the property of their respective owners.</span>
        </div>

        <div class="footer-social">
            <span>Follow us:</span>
            <a href="#" title="Facebook"><img src="facebook-icon.png" alt="Facebook" /></a>
            <a href="#" title="Twitter"><img src="twitter-icon.png" alt="Twitter" /></a>
            <a href="#" title="Instagram"><img src="instagram-icon.png" alt="Instagram" /></a>
            <a href="#" title="LinkedIn"><img src="linkedin-icon.png" alt="LinkedIn" /></a>
        </div>

        <div class="footer-contact">
            <span>Email: support@i-cart.com | Phone: +1 (800) 123-4567</span><br />
            <a href="#">Subscribe to our newsletter</a>
        </div>
    </div>
</footer>


    <script>
        // Product data embedded directly in the page
        const products = [
            {
                id: 1,
                name: 'HP Pavilion 15-dk0045tx Gaming Laptop',
                category: 'electronics',
                price: 78999.00,
                image: 'img/hppavilion.jpg',
                description: 'Powerful gaming laptop with Intel Core i7 processor, 16GB RAM, and NVIDIA GTX graphics.'
            },
            {
                id: 2,
                name: 'Redmi Note 10 Pro Max (Vintage Bronze, 6GB RAM, 128GB Storage)',
                category: 'electronics',
                price: 18999.00,
                image: 'img/redminote10.gif',
                description: '108MP Quad Camera | 120Hz Super AMOLED Display. Experience super smooth performance.'
            },
            {
                id: 3,
                name: 'I-Cart Brand - Symbol Men\'s Regular Fit Solid Polo',
                category: 'fashion',
                price: 499.00,
                image: 'img/polo.jpg',
                description: 'Comfortable and stylish regular fit polo shirt made from high-quality cotton blend.'
            },
            {
                id: 4,
                name: 'Usha Thunderbolt 750-Watt Mixer Grinder',
                category: 'home-kitchen',
                price: 2850.00,
                image: 'img/ushagrinder.jpeg',
                description: 'Powerful mixer grinder with three stainless steel jars for all your kitchen needs.'
            },
            {
                id: 5,
                name: 'The Alchemist Paperback – by Paulo Coelho',
                category: 'books',
                price: 249.00,
                image: 'img/book2.jpg',
                description: 'An international bestseller, The Alchemist by Paulo Coelho has inspired a generation of readers.'
            },
            {
                id: 6,
                name: 'boAt Airdopes 131 Wireless Earbuds with upto 15 Hours Playback',
                category: 'electronics',
                price: 1299.00,
                image: 'img/airbuds.jpg',
                description: 'Immersive audio experience with long-lasting battery life and instant connect technology.'
            },
            {
                id: 7,
                name: 'Fastrack Reflex 3.0 Smart Band – Full Touch Color Display',
                category: 'fashion',
                price: 1995.00,
                image: 'img/fastrack.jpg',
                description: 'Track your steps, heart rate, sleep, and more with this stylish smart band.'
            },
            {
                id: 8,
                name: 'Pigeon by Stovekraft Favourite Induction Base Non-Stick Kadai',
                category: 'home-kitchen',
                price: 799.00,
                image: 'img/kadai.jpg',
                description: 'Durable non-stick kadai for healthy and convenient cooking. Induction friendly.'
            },
            {
                id: 9,
                name: 'Atomic Habits: An Easy & Proven Way to Build Good Habits & Break Bad Ones',
                category: 'books',
                price: 450.00,
                image: 'img/book3.jpg',
                description: 'A groundbreaking book that reveals how tiny changes can yield remarkable results.'
            },
            {
                id: 10,
                name: 'Noise ColorFit Pulse Smartwatch',
                category: 'electronics',
                price: 1899.00,
                image: 'img/noicewach.jpg',
                description: 'Full touch display smartwatch with SPO2 monitoring, 24*7 heart rate monitoring, and 10-day battery.'
            },
            {
                id: 11,
                name: 'Samsung Galaxy Tab A8 (4GB RAM, 64GB Storage)',
                category: 'electronics',
                price: 21999.00,
                image: 'img/samsungtab.jpg',
                description: '10.5-inch display tablet with powerful performance for work and entertainment.'
            },
            {
                id: 12,
                name: 'I-Cart Women\'s Floral Maxi Dress',
                category: 'fashion',
                price: 899.00,
                image: 'img/maxidress.jpg',
                description: 'Elegant and comfortable floral maxi dress, perfect for casual and semi-formal occasions.'
            },
            {
                id: 13,
                name: 'Prestige Electric Kettle PKOSS 1.5 Litre',
                category: 'home-kitchen',
                price: 999.00,
                image: 'img/kettale.jpg',
                description: 'Stainless steel electric kettle with auto shut-off for safe and quick boiling.'
            },
            {
                id: 14,
                name: 'Sapiens: A Brief History of Humankind by Yuval Noah Harari',
                category: 'books',
                price: 399.00,
                image: 'img/sapiens.jpg',
                description: 'A thought-provoking exploration of the history and impact of Homo sapiens.'
            },
            {
                id: 15,
                name: 'JBL Charge 5 Portable Bluetooth Speaker',
                category: 'electronics',
                price: 14999.00,
                image: 'img/jblspeaker.jpg',
                description: 'Powerful sound with deep bass and up to 20 hours of playtime.'
            },
            {
                id: 16,
                name: 'I-Cart Men\'s Slim Fit Denim Jeans',
                category: 'fashion',
                price: 1299.00,
                image: 'img/denimjeans.jpg',
                description: 'Stylish slim-fit jeans with stretch fabric for comfort and durability.'
            },
            {
                id: 17,
                name: 'Philips Air Fryer HD9252/90',
                category: 'home-kitchen',
                price: 7999.00,
                image: 'img/airfryer.jpg',
                description: 'Healthy frying with Rapid Air technology, perfect for guilt-free snacks.'
            },
            {
                id: 18,
                name: 'Ikigai: The Japanese Secret to a Long and Happy Life',
                category: 'books',
                price: 350.00,
                image: 'img/ikigai.jpg',
                description: 'Discover the Japanese philosophy for finding purpose and happiness.'
            },
            {
                id: 19,
                name: 'Sony WH-CH510 Wireless Headphones',
                category: 'electronics',
                price: 3999.00,
                image: 'img/sonyheadphones.jpg',
                description: 'Lightweight wireless headphones with up to 35 hours of battery life.'
            },
            {
                id: 20,
                name: 'I-Cart Women\'s Leather Handbag',
                category: 'fashion',
                price: 1999.00,
                image: 'img/handbag.jpg',
                description: 'Chic and spacious leather handbag, ideal for daily use or special occasions.'
            },
            {
                id: 21,
                name: 'Borosil Glass Mixing Bowl Set (3 Pieces)',
                category: 'home-kitchen',
                price: 1299.00,
                image: 'img/mixingbowls.jpg',
                description: 'Versatile microwave-safe glass bowls for mixing, serving, and storing.'
            },
            {
                id: 22,
                name: 'The Power of Habit by Charles Duhigg',
                category: 'books',
                price: 420.00,
                image: 'img/powerofhabit.jpg',
                description: 'Learn why habits exist and how they can be changed to transform your life.'
            },
            {
                id: 23,
                name: 'OnePlus Nord CE 3 Lite 5G (8GB RAM, 128GB Storage)',
                category: 'electronics',
                price: 19999.00,
                image: 'img/oneplusnord.png',
                description: 'Fast 5G smartphone with 108MP camera and 67W fast charging.'
            },
            {
                id: 24,
                name: 'I-Cart Men\'s Casual Sneakers',
                category: 'fashion',
                price: 1499.00,
                image: 'img/sneakers.jpg',
                description: 'Trendy and comfortable sneakers for everyday wear, made with breathable mesh.'
            },
            {
                id: 25,
                name: 'Hawkins Contura Black Pressure Cooker, 3 Litre',
                category: 'home-kitchen',
                price: 1899.00,
                image: 'img/pressurecooker.jpg',
                description: 'Durable pressure cooker for fast and efficient cooking, suitable for all stovetops.'
            },
            {
                id: 26,
                name: 'Thinking, Fast and Slow by Daniel Kahneman',
                category: 'books',
                price: 499.00,
                image: 'img/thinkingfast.jpg',
                description: 'A fascinating look at how the mind makes decisions, by a Nobel Prize winner.'
            },
            {
                id: 27,
                name: 'Can’t Hurt Me by David Goggins',
                category: 'books',
                price: 499.00,
                image: 'img/canthurtme.jpg',
                description: 'A powerful memoir of Navy SEAL David Goggins and his journey of mental toughness, resilience, and pushing beyond limits.'
            },
            {
                id: 28,
                name: 'I-Cart Women\'s Embroidered Kurta Set',
                category: 'fashion',
                price: 1599.00,
                image: 'img/kurtaset.jpg',
                description: 'Elegant kurta set with intricate embroidery, perfect for festive occasions.'
            },
            {
                id: 29,
                name: 'Crompton Silent Pro Blossom Ceiling Fan',
                category: 'home-kitchen',
                price: 3499.00,
                image: 'img/ceilingfan.jpg',
                description: 'Energy-efficient ceiling fan with silent operation and modern design.'
            },
            {
                id: 30,
                name: 'Man’s Search for Meaning by Viktor E. Frankl',
                category: 'books',
                price: 299.00,
                image: 'img/manssearch.jpg',
                description: 'A profound memoir and psychological exploration of finding purpose in life.'
            },
            {
                id: 31,
                name: 'Lenovo IdeaPad Slim 3 (12th Gen, 8GB RAM, 512GB SSD)',
                category: 'electronics',
                price: 54999.00,
                image: 'img/lenovolaptop.jpg',
                description: 'Sleek and lightweight laptop with Intel i5 processor for work and entertainment.'
            },
            {
                id: 32,
                name: 'I-Cart Men\'s Formal Blazer',
                category: 'fashion',
                price: 3499.00,
                image: 'img/blazer.jpg',
                description: 'Sharp and tailored blazer for formal events, crafted from premium fabric.'
            },
            {
                id: 33,
                name: 'Milton Thermosteel Flip Lid Flask, 1000ml',
                category: 'home-kitchen',
                price: 1099.00,
                image: 'img/thermos.jpg',
                description: 'Insulated stainless steel flask to keep beverages hot or cold for hours.'
            },
            {
                id: 34,
                name: 'Educated: A Memoir by Tara Westover',
                category: 'books',
                price: 380.00,
                image: 'img/educated.jpg',
                description: 'A compelling memoir about a woman’s quest for knowledge against all odds.'
            },
            {
                id: 35,
                name: 'Xiaomi 55-inch 4K Ultra HD Smart LED TV',
                category: 'electronics',
                price: 39999.00,
                image: 'img/xiaomitv.jpg',
                description: 'Immersive 4K smart TV with Dolby Vision and built-in streaming apps.'
            },
                {
                    id: 36,
                    name: 'I-Cart Women\'s Casual Tote Bag',
                    category: 'fashion',
                    price: 999.00,
                    image: 'img/totebag.jpg',
                    description: 'Stylish and spacious tote bag, perfect for work, travel, or casual outings.'
                },
                {
                    id: 37,
                    name: 'Bajaj Frore 1200mm Ceiling Fan',
                    category: 'home-kitchen',
                    price: 2299.00,
                    image: 'img/bajajfan.jpg',
                    description: 'High-speed ceiling fan with energy-efficient design and sleek look.'
                },
                {
                    id: 38,
                    name: 'Becoming by Michelle Obama',
                    category: 'books',
                    price: 450.00,
                    image: 'img/becoming.jpg',
                    description: 'An intimate and inspiring memoir by the former First Lady of the United States.'
                },
                {
                    id: 39,
                    name: 'boAt Stone 1200 Portable Bluetooth Speaker',
                    category: 'electronics',
                    price: 4999.00,
                    image: 'img/boatstone.jpg',
                    description: 'Robust Bluetooth speaker with 14W sound and IPX7 water resistance.'
                },
                {
                    id: 40,
                    name: 'I-Cart Men\'s Leather Formal Shoes',
                    category: 'fashion',
                    price: 2499.00,
                    image: 'img/formalshoes.jpg',
                    description: 'Premium leather shoes with cushioned soles for comfort and style.'
                }
        ];
        </script>
        <script src="script.js"></script>
</body>
</html>