# Kotlin Orders Service

This service exposes simple endpoints for creating and listing sales orders. It uses the [Ktor](https://ktor.io/) framework and listens on **port 3010**.

## Building

Use Gradle to install the distribution:

```bash
cd services/kotlin-orders
gradle installDist
```

The compiled distribution will be placed in `build/install/kotlin-orders/`.

## Running Locally

After building, run the service with the generated script:

```bash
build/install/kotlin-orders/bin/kotlin-orders
```

The service will start on `http://localhost:3010`.

## Docker

Build and run the container:

```bash
docker build -t kotlin-orders .
docker run -p 3010:3010 kotlin-orders
```

## Endpoints

- `GET /` – health check returning "Order service running".
- `GET /orders` – list all orders.
- `POST /orders` – create a new order using JSON body `{ "item": "name", "quantity": 1 }`.
