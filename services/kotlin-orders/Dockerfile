# Build stage
FROM gradle:8.4-jdk21-temurin AS build
WORKDIR /workspace
COPY . .
RUN gradle installDist

# Runtime stage
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /workspace/build/install/kotlin-orders/ /app/
EXPOSE 3010
CMD ["./bin/kotlin-orders"]
