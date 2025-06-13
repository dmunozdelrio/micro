FROM ubuntu:22.04 AS build
RUN apt-get update && apt-get install -y build-essential cmake
WORKDIR /app
COPY CMakeLists.txt .
COPY src ./src
RUN cmake -B build -S . && cmake --build build --config Release

FROM ubuntu:22.04
WORKDIR /app
COPY --from=build /app/build/cpp-hardware ./cpp-hardware
EXPOSE 3014
CMD ["./cpp-hardware"]
