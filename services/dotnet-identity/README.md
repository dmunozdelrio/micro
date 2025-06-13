# .NET Identity Service

This service exposes simple authentication endpoints using ASP.NET Core Minimal APIs. It listens on **port 3006**.

## Endpoints

- `POST /register` – register a new user. Expects JSON `{ "username": "user", "password": "pass" }`.
- `POST /login` – authenticate a user with the same JSON payload.
- `GET /` – health check.

Users are stored in-memory for demonstration purposes only.

## Build and Run

### With .NET SDK

```bash
cd services/dotnet-identity
# build and run
dotnet run --urls http://localhost:3006
```

### With Docker

Build the image and run the container:

```bash
docker build -t dotnet-identity .
docker run -p 3006:3006 dotnet-identity
```

The service will be available at `http://localhost:3006`.

