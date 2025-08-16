<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Success.aspx.cs" Inherits="Success" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Success - I-Cart</title>
    <link href="https://fonts.googleapis.com/css2?family=Amazon+Ember:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Amazon Ember', sans-serif;
            background: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .loader-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: #fff;
            z-index: 1000;
            opacity: 1;
            transition: opacity 0.5s ease-out;
        }

        .loader-container.hidden {
            opacity: 0;
            pointer-events: none;
        }

        .spinner {
            width: 60px;
            height: 60px;
            border: 6px solid #e0e0e0;
            border-top: 6px solid #008000;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin-bottom: 20px;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        .loader-text {
            font-size: 1.2rem;
            color: #333;
        }

        .success-container {
            max-width: 500px;
            margin: 60px auto;
            padding: 32px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 16px rgba(0,0,0,0.08);
            text-align: center;
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.5s ease-out, transform 0.5s ease-out;
        }

        .success-container.visible {
            opacity: 1;
            transform: translateY(0);
        }

        .checkmark {
            width: 80px;
            height: 80px;
            display: inline-block;
            margin-bottom: 20px;
            opacity: 0;
            transform: scale(0.8);
            transition: opacity 0.5s ease-out 0.3s, transform 0.5s ease-out 0.3s;
        }

        .success-container.visible .checkmark {
            opacity: 1;
            transform: scale(1);
        }

        .checkmark__circle {
            stroke: #008000;
            stroke-width: 6;
            fill: none;
            stroke-dasharray: 251.2;
            stroke-dashoffset: 251.2;
            animation: drawCircle 0.7s ease-out forwards;
        }

        .checkmark__check {
            stroke: #008000;
            stroke-width: 6;
            fill: none;
            stroke-dasharray: 50;
            stroke-dashoffset: 50;
            animation: drawCheck 0.4s ease-out 0.7s forwards;
        }

        @keyframes drawCircle {
            to { stroke-dashoffset: 0; }
        }

        @keyframes drawCheck {
            to { stroke-dashoffset: 0; }
        }

        .success-container h1 {
            color: #008000;
            margin-bottom: 16px;
            font-size: 2rem;
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.5s ease-out 0.5s, transform 0.5s ease-out 0.5s;
        }

        .success-container.visible h1 {
            opacity: 1;
            transform: translateY(0);
        }

        .success-container p {
            font-size: 1.2rem;
            color: #333;
            margin-bottom: 24px;
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.5s ease-out 0.7s, transform 0.5s ease-out 0.7s;
        }

        .success-container.visible p {
            opacity: 1;
            transform: translateY(0);
        }

        .success-container a {
            display: inline-block;
            margin-top: 16px;
            padding: 10px 24px;
            background: #ffd814;
            color: #111;
            border-radius: 4px;
            text-decoration: none;
            font-weight: bold;
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.5s ease-out 0.9s, transform 0.5s ease-out 0.9s, background 0.3s ease;
        }

        .success-container.visible a {
            opacity: 1;
            transform: translateY(0);
        }

        .success-container a:hover {
            background: #f7ca00;
        }

        @media (max-width: 600px) {
            .success-container {
                margin: 20px;
                padding: 24px;
            }

            .success-container h1 {
                font-size: 1.8rem;
            }

            .success-container p {
                font-size: 1rem;
            }   
        }
    </style>
</head>
<body>
    <div class="loader-container" id="loader">
        <div class="spinner"></div>
        <div class="loader-text">Processing your order...</div>
    </div>
    <div class="success-container" id="success">
        <span class="checkmark">
            <svg width="80" height="80">
                <circle class="checkmark__circle" cx="40" cy="40" r="40" />
                <polyline class="checkmark__check" points="24,44 36,58 58,30" />
            </svg>
        </span>
        <h1>Thank You!</h1>
        <p>Your order has been placed successfully.<br>Your payment was received, and your items will be shipped soon.</p>
        <a href="Home.aspx">Continue Shopping</a>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const loader = document.getElementById('loader');
        const success = document.getElementById('success');

        setTimeout(() => {
            loader.classList.add('hidden');
        success.classList.add('visible');
        }, 2000); // 4-second delay for loading animation
        });
    </script>
</body>
</html>
