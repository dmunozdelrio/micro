FROM haskell:9.4.8-slim AS builder

WORKDIR /app

COPY . .

RUN cabal update
RUN cabal build exe:haskell-compliance # Build the specific executable

# Create a directory for the installed binary and install it there
RUN mkdir -p /app/output_bin
RUN cabal install exe:haskell-compliance --installdir=/app/output_bin --overwrite-policy=always

# Stage 2: Create the runtime image
FROM debian:bookworm-slim

WORKDIR /app

# Copy the executable from the known location in the builder stage
COPY --from=builder /app/output_bin/haskell-compliance /app/haskell-compliance

# Ensure the binary is executable
RUN chmod +x /app/haskell-compliance

EXPOSE 3009
CMD ["./haskell-compliance"]
