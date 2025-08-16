// Ensure data.js is loaded before script.js in your HTML for 'products' to be available.

// DOM Elements
const searchInput = document.getElementById('search-input');
const searchButton = document.getElementById('search-button');
const productSearchInput = document.getElementById('product-search');
const categoryFilterSelect = document.getElementById('category-filter');
const productGrid = document.getElementById('product-grid');
const cartCountSpan = document.getElementById('cart-count');
const cartIcon = document.querySelector('.cart-icon');
const shoppingCartSidebar = document.getElementById('shopping-cart-sidebar');
const closeCartBtn = shoppingCartSidebar.querySelector('.close-cart');
const cartItemsContainer = shoppingCartSidebar.querySelector('.cart-items');
const cartTotalSpan = document.getElementById('cart-total');
const proceedToCheckoutBtn = shoppingCartSidebar.querySelector('.proceed-to-checkout');
const heroCarousel = document.querySelector('.hero-carousel');
const carouselItems = document.querySelectorAll('.carousel-item');
const carouselPrevBtn = document.querySelector('.carousel-prev');
const carouselNextBtn = document.querySelector('.carousel-next');
const hamburgerMenu = document.querySelector('.hamburger-menu');
const subNavLinks = document.querySelector('.sub-nav-links');
const categoryShopNowLinks = document.querySelectorAll('.category-card a');


let cart = JSON.parse(localStorage.getItem('amazonCloneCart')) || []; // Load cart from localStorage
let currentCarouselIndex = 0;
let carouselInterval;

// --- Utility Functions ---

/**
 * Saves the current cart state to localStorage.
 */
function saveCartToLocalStorage() {
    localStorage.setItem('amazonCloneCart', JSON.stringify(cart));
}

/**
 * Formats a number as Indian Rupees.
 * @param {number} amount - The amount to format.
 * @returns {string} - The formatted currency string.
 */
function formatIndianCurrency(amount) {
    return `₹${amount.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ',')}`;
}

// --- Product Rendering & Filtering ---

/**
 * Creates an HTML product card element for the product listing.
 * @param {Object} product - The product object.
 * @returns {HTMLElement} - The created product card div.
 */
function createProductCard(product) {
    const productCard = document.createElement('div');
    productCard.classList.add('product-card-listing');
    productCard.dataset.id = product.id;

    productCard.innerHTML = `
        <img src="${product.image}" alt="${product.name}">
        <h3>${product.name}</h3>
        <p class="price">${formatIndianCurrency(product.price)}</p>
        <button class="add-to-cart-btn" data-id="${product.id}">Add to Cart</button>
    `;

    // Add event listener for "Add to Cart" button
    productCard.querySelector('.add-to-cart-btn').addEventListener('click', () => {
        addToCart(product.id);
    });

    return productCard;
}

/**
 * Renders products into the main product grid based on filters and search.
 * @param {Array} productsToRender - An array of product objects to display.
 */
function renderProducts(productsToRender) {
    productGrid.innerHTML = ''; // Clear existing products

    if (productsToRender.length === 0) {
        productGrid.innerHTML = '<p style="text-align: center; grid-column: 1 / -1; color: var(--text-color-light);">No products found matching your criteria.</p>';
        return;
    }

    productsToRender.forEach(product => {
        productGrid.appendChild(createProductCard(product));
    });
}

/**
 * Applies current search and category filters to the product list.
 */
function applyFiltersAndSearch() {
    const searchTerm = productSearchInput.value.toLowerCase().trim();
    const selectedCategory = categoryFilterSelect.value;

    let filteredProducts = products.filter(product => {
        const matchesSearch = product.name.toLowerCase().includes(searchTerm) ||
                              product.description.toLowerCase().includes(searchTerm);
        const matchesCategory = selectedCategory === 'all' || product.category === selectedCategory;
        return matchesSearch && matchesCategory;
    });

    renderProducts(filteredProducts);
}

// Event listeners for product filtering and search
productSearchInput.addEventListener('input', applyFiltersAndSearch);
categoryFilterSelect.addEventListener('change', applyFiltersAndSearch);

// Initial render of all products
document.addEventListener('DOMContentLoaded', () => {
    renderProducts(products);
    updateCartDisplay(); // Update cart count and items on load
    startCarousel(); // Start the hero carousel
});

// --- Category "Shop now" links
categoryShopNowLinks.forEach(link => {
    link.addEventListener('click', (e) => {
        e.preventDefault();
        const category = e.target.dataset.category;
        categoryFilterSelect.value = category; // Set the filter
        applyFiltersAndSearch(); // Apply the filter
        document.querySelector('.product-listing-section').scrollIntoView({ behavior: 'smooth' });
    });
});


// --- Shopping Cart Logic ---

/**
 * Adds a product to the cart. If already exists, increments quantity.
 * @param {number} productId - The ID of the product to add.
 */
function addToCart(productId) {
    const product = products.find(p => p.id === productId);
    if (!product) return;

    const cartItem = cart.find(item => item.id === productId);

    if (cartItem) {
        cartItem.quantity++;
    } else {
        cart.push({ ...product, quantity: 1 });
    }
    updateCartDisplay();
    saveCartToLocalStorage();
    shoppingCartSidebar.classList.add('open'); // Open cart sidebar
}

/**
 * Removes a product from the cart completely.
 * @param {number} productId - The ID of the product to remove.
 */
function removeFromCart(productId) {
    cart = cart.filter(item => item.id !== productId);
    updateCartDisplay();
    saveCartToLocalStorage();
}

/**
 * Updates the quantity of a product in the cart.
 * @param {number} productId - The ID of the product.
 * @param {number} change - The amount to change the quantity by (+1 or -1).
 */
function updateQuantity(productId, change) {
    const cartItem = cart.find(item => item.id === productId);
    if (cartItem) {
        cartItem.quantity += change;
        if (cartItem.quantity <= 0) {
            removeFromCart(productId);
        } else {
            updateCartDisplay();
            saveCartToLocalStorage();
        }
    }
}

/**
 * Calculates the total price of all items in the cart.
 * @returns {number} - The total cart value.
 */
function calculateCartTotal() {
    return cart.reduce((total, item) => total + (item.price * item.quantity), 0);
}

/**
 * Renders the cart items in the sidebar and updates the total.
 */
function updateCartDisplay() {
    cartItemsContainer.innerHTML = ''; // Clear previous items
    let totalItemsInCart = 0;

    if (cart.length === 0) {
        cartItemsContainer.innerHTML = '<p style="text-align: center; color: var(--text-color-light);">Your cart is empty.</p>';
    } else {
        cart.forEach(item => {
            totalItemsInCart += item.quantity;
            const cartItemDiv = document.createElement('div');
            cartItemDiv.classList.add('cart-item');
            cartItemDiv.innerHTML = `
                <img src="${item.image}" alt="${item.name}">
                <div class="item-details">
                    <h4>${item.name}</h4>
                    <p class="price">${formatIndianCurrency(item.price * item.quantity)}</p>
                    <div class="item-quantity-controls">
                        <button class="decrease-quantity" data-id="${item.id}">-</button>
                        <span>${item.quantity}</span>
                        <button class="increase-quantity" data-id="${item.id}">+</button>
                    </div>
                </div>
                <button class="remove-item-btn" data-id="${item.id}">Remove</button>
            `;
            cartItemsContainer.appendChild(cartItemDiv);
        });
    }

    cartCountSpan.textContent = totalItemsInCart;
    cartTotalSpan.textContent = formatIndianCurrency(calculateCartTotal());

    // Attach event listeners to the dynamically created cart item buttons
    cartItemsContainer.querySelectorAll('.decrease-quantity').forEach(button => {
        button.addEventListener('click', (e) => updateQuantity(parseInt(e.target.dataset.id), -1));
    });
    cartItemsContainer.querySelectorAll('.increase-quantity').forEach(button => {
        button.addEventListener('click', (e) => updateQuantity(parseInt(e.target.dataset.id), 1));
    });
    cartItemsContainer.querySelectorAll('.remove-item-btn').forEach(button => {
        button.addEventListener('click', (e) => removeFromCart(parseInt(e.target.dataset.id)));
    });
}

// Open/Close Cart Sidebar
cartIcon.addEventListener('click', (e) => {
    e.preventDefault();
    shoppingCartSidebar.classList.add('open');
});

closeCartBtn.addEventListener('click', () => {
    shoppingCartSidebar.classList.remove('open');
});

// Proceed to Checkout (mock functionality)
// Attach sidebar cart event listeners after DOM is ready
document.addEventListener('DOMContentLoaded', () => {
    if (proceedToCheckoutBtn) {
        proceedToCheckoutBtn.addEventListener('click', () => {
            if (cart.length === 0) {
                alert('Your cart is empty! Please add items before proceeding to checkout.');
                return;
            }
            shoppingCartSidebar.classList.remove('open');
            setTimeout(() => {
                window.location.href = 'cart.html';
            }, 200);
        });
    }
    const goToCartBtn = document.getElementById('go-to-cart');
    if (goToCartBtn) {
        goToCartBtn.addEventListener('click', () => {
            shoppingCartSidebar.classList.remove('open');
            setTimeout(() => {
                window.location.href = 'cart.html';
            }, 200);
        });
    }
});

// Go to Cart Page button
const goToCartBtn = document.getElementById('go-to-cart');
if (goToCartBtn) {
    goToCartBtn.addEventListener('click', () => {
        window.location.href = 'cart.html';
    });
}

// --- Hero Carousel ---

/**
 * Shows a specific slide in the carousel.
 * @param {number} index - The index of the slide to show.
 */
function showSlide(index) {
    carouselItems.forEach((item, i) => {
        item.classList.remove('active');
        if (i === index) {
            item.classList.add('active');
        }
    });
}

/**
 * Moves to the next slide in the carousel.
 */
function nextSlide() {
    currentCarouselIndex = (currentCarouselIndex + 1) % carouselItems.length;
    showSlide(currentCarouselIndex);
}

/**
 * Moves to the previous slide in the carousel.
 */
function prevSlide() {
    currentCarouselIndex = (currentCarouselIndex - 1 + carouselItems.length) % carouselItems.length;
    showSlide(currentCarouselIndex);
}

/**
 * Starts the automatic carousel rotation.
 */
function startCarousel() {
    showSlide(currentCarouselIndex); // Show initial slide
    carouselInterval = setInterval(nextSlide, 5000); // Change slide every 5 seconds
}

// Carousel navigation event listeners
carouselNextBtn.addEventListener('click', () => {
    clearInterval(carouselInterval); // Stop auto-play on manual navigation
    nextSlide();
    startCarousel(); // Restart auto-play
});

carouselPrevBtn.addEventListener('click', () => {
    clearInterval(carouselInterval); // Stop auto-play on manual navigation
    prevSlide();
    startCarousel(); // Restart auto-play
});


// --- Mobile Menu (Hamburger) ---

hamburgerMenu.addEventListener('click', () => {
    subNavLinks.classList.toggle('active');
});

// Global search bar (top nav) - mock functionality
searchInput.addEventListener('keypress', (e) => {
    if (e.key === 'Enter') {
        alert(`Searching Amazon.in for: "${searchInput.value}"`);
        // In a real app, you'd trigger a page redirect or a more complex search
    }
});

searchButton.addEventListener('click', () => {
    alert(`Searching Amazon.in for: "${searchInput.value}"`);
});