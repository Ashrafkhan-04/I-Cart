// cart.js
// Handles cart page rendering and logic

function formatIndianCurrency(amount) {
    return `₹${amount.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ',')}`;
}

let cart = JSON.parse(localStorage.getItem('amazonCloneCart')) || [];

function renderCart() {
    const cartItemsList = document.getElementById('cart-items-list');
    const cartTotalSpan = document.getElementById('cart-total');
    cartItemsList.innerHTML = '';
    let total = 0;
    let totalItems = 0;

    if (cart.length === 0) {
        cartItemsList.innerHTML = '<p style="text-align:center; color:#555;">Your cart is empty.</p>';
    } else {
        cart.forEach(item => {
            total += item.price * item.quantity;
        totalItems += item.quantity;

        const div = document.createElement('div');
        div.className = 'cart-item'; // Amazon-style row

        div.innerHTML = `
            <img src="${item.image}" alt="${item.name}" class="item-image">
            <div class="item-details">
                <h4 class="item-title">${item.name}</h4>
                <p class="price">${formatIndianCurrency(item.price * item.quantity)}</p>
                <div class="item-quantity-controls">
                    <button class="quantity-btn decrease-quantity" data-id="${item.id}">-</button>
                    <span class="quantity-value">${item.quantity}</span>
                    <button class="quantity-btn increase-quantity" data-id="${item.id}">+</button>
                </div>
                <button class="remove-item-btn" data-id="${item.id}">Remove</button>
            </div>
            `;
        cartItemsList.appendChild(div);
    });
}

cartTotalSpan.textContent = formatIndianCurrency(total);

// Update cart count in nav
const cartCountSpan = document.getElementById('cart-count');
if (cartCountSpan) cartCountSpan.textContent = totalItems;

// Attach event listeners
cartItemsList.querySelectorAll('.decrease-quantity').forEach(btn => {
    btn.addEventListener('click', e => updateQuantity(parseInt(e.target.dataset.id), -1));
});
cartItemsList.querySelectorAll('.increase-quantity').forEach(btn => {
    btn.addEventListener('click', e => updateQuantity(parseInt(e.target.dataset.id), 1));
});
cartItemsList.querySelectorAll('.remove-item-btn').forEach(btn => {
    btn.addEventListener('click', e => removeFromCart(parseInt(e.target.dataset.id)));
});
}

function updateQuantity(productId, change) {
    const item = cart.find(i => i.id === productId);
    if (item) {
        item.quantity += change;
        if (item.quantity <= 0) {
            removeFromCart(productId);
        } else {
            saveCart();
            renderCart();
        }
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

document.addEventListener('DOMContentLoaded', () => {
    renderCart();

// Proceed to checkout button
const proceedBtn = document.querySelector('.proceed-to-checkout');
if (proceedBtn) {
    proceedBtn.addEventListener('click', () => {
        if (cart.length === 0) {
            alert('Your cart is empty! Please add items before proceeding to checkout.');
}
});
}

// Payment options logic
    const payNowBtn = document.getElementById('pay-now-btn');
if (payNowBtn) {
    payNowBtn.addEventListener('click', () => {
        if (cart.length === 0) {
            alert('Your cart is empty! Please add items before making a payment.');
    return;
}
cart = [];
saveCart();
window.location.href = 'success.html';
});
}
});
