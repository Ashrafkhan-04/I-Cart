<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>I-Cart - Shopping Cart</title>
    <link href="https://fonts.googleapis.com/css2?family=Amazon+Ember:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* ===== Reset ===== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: "Amazon Ember", Arial, sans-serif;
            background-color: #e3e6e6;
            color: #111;
        }
        /* ===== Header ===== */
        .top-nav {
            background-color: #131921;
            color: white;
            display: flex;
            align-items: center;
            padding: 10px 20px;
            justify-content: space-between;
        }
        .brand-name {
            font-size: 20px;
            font-weight: bold;
            color: #f0c14b;
        }
        .location-picker {
            font-size: 12px;
            color: #ccc;
        }
        .nav-search {
            display: flex;
            flex: 1;
            max-width: 600px;
            margin: 0 20px;
        }
        .nav-search input {
            flex: 1;
            padding: 8px;
            border: none;
            outline: none;
        }
        .nav-search button {
            background-color: #febd69;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
        }
        .nav-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        .cart-icon {
            display: flex;
            align-items: center;
            gap: 6px;
            font-size: 14px;
        }
        .cart-icon img {
            width: 24px;
            height: 24px;
            object-fit: contain;
        }
        /* ===== Sub Nav ===== */
        .sub-nav {
            background-color: #232f3e;
            padding: 8px 20px;
        }
        .sub-nav-links {
            display: flex;
            gap: 15px;
            list-style: none;
        }
        .sub-nav-links a {
            color: white;
            text-decoration: none;
            font-size: 14px;
        }
        .sub-nav-links a:hover {
            text-decoration: underline;
        }
        /* ===== Cart Layout ===== */
        .cart-page-section {
            max-width: 1400px;
            margin: 20px auto;
            padding: 0 20px;
            display: flex;
            gap: 20px;
            align-items: flex-start;
        }
        /* ===== Left Side ===== */
        .cart-items-list {
            flex: 3;
            background-color: white;
            padding: 20px;
            border-radius: 4px;
            box-shadow: 0 1px 2px rgba(0,0,0,0.1);
        }
        .cart-items-list h2 {
            font-size: 22px;
            font-weight: 400;
            margin-bottom: 15px;
        }
        .cart-item {
            display: flex;
            align-items: flex-start;
            gap: 16px;
            padding: 15px 0;
            border-bottom: 1px solid #ddd;
        }
        .cart-item:last-child {
            border-bottom: none;
        }
        .cart-item img {
            width: 150px;
            height: 150px;
            object-fit: contain;
            border: 1px solid #ddd;
            background-color: #fff;
            padding: 6px;
        }
        /* ===== Item Details ===== */
        .item-details {
            flex: 1;
        }
        .item-title {
            font-size: 16px;
            font-weight: 500;
            color: #007185;
            margin-bottom: 6px;
            cursor: pointer;
        }
        .item-title:hover {
            text-decoration: underline;
        }
        .price {
            font-size: 18px;
            font-weight: bold;
            color: #B12704;
            margin-bottom: 8px;
        }
        .item-actions {
            font-size: 14px;
            margin-top: 6px;
        }
        .item-actions a {
            color: #007185;
            cursor: pointer;
            margin-right: 10px;
        }
        .item-actions a:hover {
            text-decoration: underline;
        }
        select.qty-select {
            padding: 4px;
            border: 1px solid #ccc;
            font-size: 14px;
        }
        /* ===== Right Side ===== */
        .cart-summary {
            flex: 1;
            background-color: white;
            padding: 20px;
            border-radius: 4px;
            box-shadow: 0 1px 2px rgba(0,0,0,0.1);
            position: sticky;
            top: 20px;
        }
        .cart-summary p {
            font-size: 18px;
            margin-bottom: 15px;
        }
        .payment-options {
            margin-bottom: 15px;
        }
        .payment-options h3 {
            font-size: 16px;
            margin-bottom: 10px;
        }
        .payment-options label {
            display: block;
            font-size: 14px;
            margin-bottom: 6px;
        }
        .proceed-to-checkout {
            display: block;
            background-color: #ffd814;
            color: #111;
            padding: 10px;
            text-align: center;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            font-size: 16px;
        }
        .proceed-to-checkout:hover {
            background-color: #f7ca00;
        }
        /* ===== Empty Cart ===== */
        .empty-cart {
            font-size: 16px;
            padding: 40px 0;
            color: #555;
            text-align: center;
        }
        /* ===== Responsive ===== */
        @media (max-width: 900px) {
            .cart-page-section {
                flex-direction: column;
            }
            .cart-summary {
                position: static;
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="top-nav">
        <div class="nav-left">
            <h1 class="brand-name">I-Cart</h1>
            <div class="location-picker">📌 Deliver to India</div>
        </div>
        <div class="nav-search">
            <input type="text" placeholder="Search I-Cart.in">
            <button><img src="img/searchlogo.jpg-removebg-preview.png" alt="Search" width="20"></button>
        </div>
        <div class="nav-right">
            <div class="cart-icon">
                <img src="img/cartlogo.jpg" alt="Cart">
                <span id="cart-count">0</span>
                <span>Cart</span>
            </div>
        </div>
    </header>
    <!-- Sub Nav -->
    <nav class="sub-nav">
        <ul class="sub-nav-links">
            <li><a href="index.html">All</a></li>
            <li><a href="#">Today's Deals</a></li>
            <li><a href="mobiles.html">Mobiles</a></li>
            <li><a href="#">Electronics</a></li>
            <li><a href="#">Fashion</a></li>
            <li><a href="#">Home & Kitchen</a></li>
            <li><a href="#">Books</a></li>
        </ul>
    </nav>
    <!-- Main Cart Layout -->
    <main class="cart-page-section">
        <!-- Left -->
        <div class="cart-items-list">
            <h2>Shopping Cart</h2>
            <div id="cart-items-list"></div>
        </div>
        <!-- Right -->
        <div class="cart-summary">
            <p>Subtotal (<span id="total-items">0</span> items): <span id="cart-total">₹0.00</span></p>
            <div class="payment-options">
                <h3>Select Payment Method</h3>
                <label><input type="radio" name="payment-method" value="card" checked> Credit/Debit Card</label>
                <label><input type="radio" name="payment-method" value="upi"> UPI</label>
                <label><input type="radio" name="payment-method" value="cod"> Cash on Delivery</label>
                <label><input type="radio" name="payment-method" value="netbanking"> Net Banking</label>
            </div>
            <a href="address.aspx" class="proceed-to-checkout">Proceed to Buy</a>
        </div>
    </main>
    <!-- JS -->
    <script>
        function formatIndianCurrency(amount) {
            return `₹${amount.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ',')}`;
        }
        let cart = JSON.parse(localStorage.getItem('amazonCloneCart')) || [];
        function renderCart() {
            const list = document.getElementById('cart-items-list');
            const totalSpan = document.getElementById('cart-total');
            const totalItemsSpan = document.getElementById('total-items');
            list.innerHTML = '';
            let total = 0, totalItems = 0;
            if (cart.length === 0) {
                list.innerHTML = '<div class="empty-cart">Your cart is empty.</div>';
            } else {
                cart.forEach(item => {
                    total += item.price * item.quantity;
                totalItems += item.quantity;
                const div = document.createElement('div');
                div.className = 'cart-item';
                div.innerHTML = `
                    <img src="${item.image}" alt="${item.name}">
                    <div class="item-details">
                        <div class="item-title">${item.name}</div>
                        <div class="price">${formatIndianCurrency(item.price * item.quantity)}</div>
                        <div>
                            <select class="qty-select" data-id="${item.id}">
                                ${[...Array(10)].map((_,i)=>`<option value="${i+1}" ${item.quantity===i+1?'selected':''}>Qty: ${i+1}</option>`).join('')}
                </select>
            </div>
            <div class="item-actions">
                <a class="delete-link" data-id="${item.id}">Delete</a>
            </div>
        </div>
                    `;
                list.appendChild(div);
            });
        }
        totalSpan.textContent = formatIndianCurrency(total);
        totalItemsSpan.textContent = totalItems;
        document.getElementById('cart-count').textContent = totalItems;
        list.querySelectorAll('.qty-select').forEach(sel => {
            sel.addEventListener('change', e => updateQuantity(parseInt(e.target.dataset.id), parseInt(e.target.value)));
        });
        list.querySelectorAll('.delete-link').forEach(link => {
            link.addEventListener('click', e => removeFromCart(parseInt(e.target.dataset.id)));
        });
        }
        function updateQuantity(productId, qty) {
            const item = cart.find(i => i.id === productId);
            if (item) {
                item.quantity = qty;
                saveCart();
                renderCart();
            }
        }
        function removeFromCart(productId) {
            cart = cart.filter(i => i.id !== productId);
            saveCart();
            renderCart();
        }
        function saveCart() {
            localStorage.setItem('amazonCloneCart', JSON.stringify(cart));
        }
        document.addEventListener('DOMContentLoaded', renderCart);
    </script>
</body>
</html>
