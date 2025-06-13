# Scala Reporting Service

This is a minimal HTTP service written in Scala. It listens on port **3011** and returns `Scala Reporting Service` for all requests.

## Setup

```
cd services/scala-reporting
sbt run
```

## Docker

```
docker build -t scala-reporting .
docker run -p 3011:3011 scala-reporting
```
