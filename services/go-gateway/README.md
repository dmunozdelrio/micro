# Go Gateway Service

A lightweight API gateway built with [Go Fiber](https://gofiber.io/). The service proxies requests to the notifications service and secures endpoints using a simple bearer token.

The server listens on **port 3003** by default and compiles to a single binary named `gateway`.

## Setup

Run the service locally:

```bash
cd services/go-gateway
go run ./cmd/server.go
```

Environment variables:

- `AUTH_TOKEN` – bearer token required in the `Authorization` header (default: `secret`).
- `NOTIFICATIONS_URL` – base URL for the notifications service (default: `http://localhost:3001`).
- `PORT` – port for the gateway (default: `3003`).

## Docker

Build and run the container:

```bash
docker build -t go-gateway .
docker run -p 3003:3003 -e AUTH_TOKEN=secret go-gateway
```

## Example Request

```bash
curl -H "Authorization: Bearer secret" \
  http://localhost:3003/notifications/email
```
