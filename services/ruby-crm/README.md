# Ruby CRM Service

This service provides simple customer endpoints using Sinatra. It runs on port **3008**.

## Setup

Install the gems and start the server:

```bash
cd services/ruby-crm
bundle install
ruby app.rb
```

The server will listen on `http://localhost:3008`.

## Docker

Build and run the container:

```bash
docker build -t ruby-crm .
docker run -p 3008:3008 ruby-crm
```

## Endpoints

- `GET /customers` – returns a list of sample customers.
- `GET /customers/:id` – returns a single customer by ID.
