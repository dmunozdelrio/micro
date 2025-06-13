FROM hseeberger/scala-sbt:11.0.14.1_1.6.2_2.13.8 AS build
WORKDIR /app
COPY build.sbt .
RUN mkdir -p src/main/scala
COPY src ./src
RUN sbt package

FROM eclipse-temurin:11-jre
WORKDIR /app
COPY --from=build /app/target/scala-2.13/scala-reporting_2.13-0.1.0.jar app.jar
EXPOSE 3011
CMD ["java", "-jar", "app.jar"]
