# Build stage
FROM rust:1.80-alpine AS builder
WORKDIR /usr/src/app
RUN apk add --no-cache musl-dev
COPY Cargo.toml .
RUN mkdir src && echo 'fn main() {}' > src/main.rs
RUN cargo fetch
COPY src ./src
RUN cargo build --release

# Runtime stage
FROM alpine:latest
WORKDIR /usr/local/bin
COPY --from=builder /usr/src/app/target/release/rust-analytics .
EXPOSE 3007
CMD ["./rust-analytics"]
