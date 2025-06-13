# Crystal IoT Service

A minimal Crystal HTTP server returning `Crystal IoT Service` on port **3016**.

## Run

```
cd services/crystal-iot
shards build --release
./bin/crystal-iot
```

## Docker

```
docker build -t crystal-iot .
docker run -p 3016:3016 crystal-iot
```
