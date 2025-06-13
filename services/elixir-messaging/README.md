# Elixir Messaging Service

This service is a minimal [Phoenix](https://www.phoenixframework.org/) application providing real-time chat/notifications over WebSockets. It listens on **port 3009** by default.

## Setup

Install Elixir and Phoenix dependencies:

```bash
mix deps.get
```

To run the server locally:

```bash
mix phx.server
```

## Building the Release

The included Dockerfile builds a production release in `_build/prod/rel/messaging`.
You can build and run the container with:

```bash
docker build -t elixir-messaging .
docker run -e SECRET_KEY_BASE=$(mix phx.gen.secret) -p 3009:3009 elixir-messaging
```

The application will be available at `http://localhost:3009`.
