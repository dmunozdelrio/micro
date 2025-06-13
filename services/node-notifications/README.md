# Node Notifications Service

This service provides simple endpoints to send email or push notifications. It runs an Express server on port **3001**.

## Setup

Install dependencies and start the server:

```bash
cd services/node-notifications
npm install
npm start
```

The server will listen on `http://localhost:3001`.

## Docker

Build and run the container:

```bash
docker build -t node-notifications .
docker run -p 3001:3001 node-notifications
```

## Endpoints

- `POST /email` – simulate sending an email notification.
- `POST /push` – simulate sending a push notification.
