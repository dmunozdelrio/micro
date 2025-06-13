# Deno Functions Service

A tiny Deno HTTP server responding with `Deno Functions Service` on port **3015**.

## Run Locally

```
cd services/deno-functions
deno run --allow-net server.ts
```

## Docker

```
docker build -t deno-functions .
docker run -p 3015:3015 deno-functions
```
