FROM swift:5.9-jammy AS build
WORKDIR /app
COPY Package.swift .
COPY Sources ./Sources
# Instala dependencia module de Swift Network 
RUN swift build -c release

FROM swift:5.9-jammy-slim
WORKDIR /app
COPY --from=build /app/.build/release/MyService ./MyService
EXPOSE 3017
CMD ["./MyService"]
