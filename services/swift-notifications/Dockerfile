FROM swift:5.9-jammy AS build
WORKDIR /app
COPY Package.swift .
COPY Sources ./Sources
RUN swift build -c release

FROM swift:5.9-jammy-slim
WORKDIR /app
COPY --from=build /app/.build/release/swift-notifications ./swift-notifications
EXPOSE 3017
CMD ["./swift-notifications"]
