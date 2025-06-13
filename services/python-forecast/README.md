# Python Forecast Service

This service exposes a small FastAPI application that returns simple weather forecasts. It listens on **port 3002**.

## Setup

Install dependencies and start the server:

```bash
cd services/python-forecast
poetry install
poetry run uvicorn src.main:app --port 3002 --reload
```

The server will be available at `http://localhost:3002`.

## Docker

Build and run the container:

```bash
docker build -t python-forecast .
docker run -p 3002:3002 python-forecast
```

## Endpoints

- `GET /health` – basic health check.
- `POST /forecast` – return a simple forecast for the requested location.
