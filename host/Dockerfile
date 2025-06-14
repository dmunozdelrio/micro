############################################
# Build stage: compilar header, trending y host
############################################
FROM node:22-alpine AS builder
WORKDIR /app

# Copiar manifest de dependencias
COPY apps/header/package*.json    apps/header/
COPY apps/trending/package*.json  apps/trending/
COPY host/package*.json           host/

# Instalar dependencias por proyecto (sin cambiar de directorio)
RUN npm --prefix apps/header   ci && \
    npm --prefix apps/trending ci && \
    npm --prefix host          ci

# Copiar el código fuente
COPY apps apps
COPY host host

# Construir la aplicación host (usa lo generado por header y trending)
RUN npm --prefix host run build

############################################
# Runtime stage: servir el host ya compilado
############################################
FROM node:22-alpine
WORKDIR /app

# Copiar artefacto compilado desde el builder
COPY --from=builder /app/host/dist ./dist

# Servidor estático lightweight
RUN npm install -g serve

EXPOSE 3000
CMD ["serve", "-s", "dist", "-l", "3000"]