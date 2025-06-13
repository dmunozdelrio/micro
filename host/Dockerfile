# Build stage: compile header, trending and host
FROM node:22-alpine AS builder
WORKDIR /app

# Copy package files and install dependencies
COPY apps/header/package*.json apps/header/
COPY apps/trending/package*.json apps/trending/
COPY host/package*.json host/
RUN cd apps/header && npm ci && cd ..
RUN cd apps/trending && npm ci && cd ..
RUN cd host && npm ci && cd ..

# Copy source code
COPY apps apps
COPY host host

# Build microfrontends and host
RUN cd apps/header && npm run build && cd ../..
RUN cd apps/trending && npm run build && cd ../..
RUN cd host && npm run build && cd ..

# Runtime stage: serve the built host
FROM node:22-alpine
WORKDIR /app

# Copy built host from builder stage
COPY --from=builder /app/host/dist ./dist

# Install lightweight static server
RUN npm install -g serve

EXPOSE 3000
CMD ["serve", "-s", "dist", "-l", "3000"]
