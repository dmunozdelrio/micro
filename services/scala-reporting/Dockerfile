FROM hseeberger/scala-sbt:11.0.14.1_1.6.2_2.13.8 AS build
WORKDIR /app
COPY . .
# Clean caches and then run sbt assembly
RUN rm -rf /root/.sbt && \
    rm -rf /root/.ivy2 && \
    sbt assembly

FROM eclipse-temurin:11-jre
WORKDIR /app
COPY --from=build /app/target/scala-2.13/scala-reporting-assembly.jar app.jar
EXPOSE 3011
CMD ["java", "-jar", "app.jar"]
