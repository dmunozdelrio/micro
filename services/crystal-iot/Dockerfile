FROM crystallang/crystal:1.11.2-alpine AS build
WORKDIR /app
COPY shards.yml .
RUN shards install
COPY src ./src
RUN shards build --release

FROM alpine:3.18
WORKDIR /app
COPY --from=build /app/bin/crystal-iot ./crystal-iot
EXPOSE 3016
CMD ["./crystal-iot"]
