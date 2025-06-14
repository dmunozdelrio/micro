# services/deno-functions/Dockerfile

# Build stage
FROM docker.io/denoland/deno:1.44.4 as deno_builder_stage

WORKDIR /app

# Install unzip, git for Deno dependencies if they are fetched from git repos, etc.
USER root
RUN apt-get update && \
    apt-get install -y unzip git && \
    rm -rf /var/lib/apt/lists/*

# Copy application files first
COPY . .
# Ensure deno user owns the application files
RUN chown -R deno:deno /app

# Switch to deno user for Deno operations
USER deno

# Cache dependencies
RUN deno cache server.ts

# Compile the application
# Output to a distinct name like server_binary
RUN deno compile --allow-net --allow-read --allow-env --output /app/server_binary server.ts

# Verify creation and permissions (deno compile should make it executable)
RUN ls -la /app/server_binary
# If \'deno compile\' doesn\'t set executable bit reliably for \'deno\' user:
# USER root
# RUN chmod +x /app/server_binary
# USER deno

# Final stage
FROM docker.io/denoland/deno:distroless

WORKDIR /app

# Copy the compiled binary from the builder stage.
# /app/server_binary in builder is owned by \'deno\' and should be executable.
# Copy to /app/server in final stage.
# --chown=deno:deno ensures the \'deno\' user (UID 1000) in the distroless image owns it.
# Permissions (including execute bit) should be preserved by COPY.
COPY --from=deno_builder_stage --chown=deno:deno /app/server_binary /app/server

EXPOSE 3005

# Define the entrypoint for the container
ENTRYPOINT ["/app/server"]
