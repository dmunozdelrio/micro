# Keycloak Identity Server

This directory provides a Dockerfile for running the Keycloak authentication server. The container exposes **port 8080**.

## Docker

Build and run:

```bash
cd tools/identity-keycloak
docker build -t identity-keycloak .
docker run -p 8080:8080 identity-keycloak
```

Access the admin console at `http://localhost:8080`.
