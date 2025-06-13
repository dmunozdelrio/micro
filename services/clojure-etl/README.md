# Clojure ETL Service

A basic Ring/Jetty application that returns `Clojure ETL Service` on port **3013**.

## Setup

```
cd services/clojure-etl
lein run
```

## Docker

```
docker build -t clojure-etl .
docker run -p 3013:3013 clojure-etl
```
