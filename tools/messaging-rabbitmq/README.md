# RabbitMQ Messaging Broker

This directory hosts a Dockerfile for running RabbitMQ with the management plugin. The container exposes **port 5672**.

## Docker

Build and run:

```bash
cd tools/messaging-rabbitmq
docker build -t messaging-rabbitmq .
docker run -p 5672:5672 messaging-rabbitmq
```

The management UI will be available at `http://localhost:15672`.
