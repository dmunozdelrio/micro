# syntax=docker/dockerfile:1
ARG CRYSTAL_VERSION=1.11.2
FROM crystallang/crystal:${CRYSTAL_VERSION}-alpine AS build
WORKDIR /app
COPY ./src/crystal-iot.cr ./src/main.cr
COPY shard.yml shard.lock ./
RUN shards install --production \
 && shards build --release --static

FROM alpine:3.18 AS app
WORKDIR /app



EXPOSE 3016
CMD ["./crystal-iot"]
