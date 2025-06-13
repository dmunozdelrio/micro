FROM clojure:temurin-11-lein AS build
WORKDIR /app
COPY project.clj .
RUN lein deps
COPY src ./src
RUN lein uberjar

FROM eclipse-temurin:11-jre
WORKDIR /app
COPY --from=build /app/target/clojure-etl-*-standalone.jar app.jar
EXPOSE 3013
CMD ["java", "-jar", "app.jar"]
