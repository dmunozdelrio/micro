FROM denoland/deno:1.42.4 AS build
WORKDIR /app
COPY server.ts .
RUN deno compile --allow-net -o server server.ts

FROM alpine:3.18
WORKDIR /app
COPY --from=build /app/server ./server
EXPOSE 3015
CMD ["./server"]
