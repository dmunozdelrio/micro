# Rust Analytics Service

This service exposes minimal analytics endpoints built with [Actix Web](https://actix.rs/). It listens on port **3007**.

## Setup

Build and run directly with Cargo:

```bash
cd services/rust-analytics
cargo run
```

The server will be available at `http://localhost:3007`.

## Docker

Build and run the container:

```bash
docker build -t rust-analytics .
docker run -p 3007:3007 rust-analytics
```

## Endpoints

- `GET /` – health check returning a simple message.
- `POST /event` – store an analytics event payload.
