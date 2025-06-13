# PHP E-commerce Service

This service exposes simple catalog and cart endpoints using the Slim framework. It listens on **port 3004**.

## Setup

Install dependencies with Composer and start the development server:

```bash
cd services/php-ecommerce
composer install
php -S localhost:3004 -t src
```

The API will be available at `http://localhost:3004`.

## Docker

Build and run the container using the provided `Dockerfile` (based on an Alpine PHP-FPM image):

```bash
docker build -t php-ecommerce .
docker run -p 3004:3004 php-ecommerce
```

## Endpoints

- `GET /catalog` – list demo products
- `GET /cart` – view current cart
- `POST /cart` – add an item to the cart (`{ "item": "Product A" }`)
