# Vendure E-commerce Server

Example container configuration for running Vendure in development mode. The application listens on **port 3050**.

## Docker

Build and run:

```bash
cd tools/ecommerce-vendure
docker build -t ecommerce-vendure .
docker run -p 3050:3050 ecommerce-vendure
```

After starting, access the admin UI at `http://localhost:3050/admin`.
