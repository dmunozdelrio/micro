FROM denoland/deno:1.42.4 AS build
WORKDIR /app

# desactivamos valid-until y date checks
RUN printf 'Acquire::Check-Valid-Until false;\nAcquire::Check-Date false;\n' \
      > /etc/apt/apt.conf.d/99no-check-valid-until \
 && apt-get update \
 && apt-get install -y --no-install-recommends unzip \
 && rm -rf /var/lib/apt/lists/*

COPY server.ts .
RUN deno compile --allow-net -o server server.ts

FROM alpine:3.18
WORKDIR /app
COPY --from=build /app/server ./server
EXPOSE 3015
CMD ["./server"]
