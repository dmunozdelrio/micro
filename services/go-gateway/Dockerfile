# Build stage
FROM golang:1.22-alpine AS builder
WORKDIR /src
COPY go.mod .
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 go build -o gateway ./cmd/server.go

# Runtime stage
FROM alpine:3.20
WORKDIR /app
COPY --from=builder /src/gateway /usr/local/bin/gateway
EXPOSE 3003
CMD ["gateway"]
