# Java Accounting Service

A minimal Spring Boot application exposing a single endpoint on **port 3005**.
The service returns a simple message at `/`.

## Build

Use Maven to package the application as `app.jar`:

```bash
cd services/java-accounting
mvn package
```

The jar will be created at `target/app.jar`.

## Run

Start the application locally:

```bash
java -jar target/app.jar
```

It will listen on `http://localhost:3005`.

## Docker

The provided `Dockerfile` uses a multi-stage build with Temurin images. Build
and run the container:

```bash
docker build -t java-accounting .
docker run -p 3005:3005 java-accounting
```

The service will be accessible on port `3005` of your host machine.
