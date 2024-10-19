export const PRODUCTS_URL = '/api/products';
export const USERS_URL = '/api/users';
export const ORDERS_URL = '/api/orders';
export const PAYPAL_URL = '/api/config/paypal';

const getBaseUrl = () => {
    const baseUrl = process.env.BACKEND_URL;
    console.log("BASE_URL is set to:", baseUrl);
    return baseUrl;
};

export const BASE_URL = getBaseUrl() || "https://shop-redhat-backend-dev.312redhat.com";
