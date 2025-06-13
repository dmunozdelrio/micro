# Haskell Compliance Service

A tiny web service written in Haskell using Warp. It responds with `Haskell Compliance Service` on port **3012**.

## Setup

```
cd services/haskell-compliance
cabal run
```

## Docker

```
docker build -t haskell-compliance .
docker run -p 3012:3012 haskell-compliance
```
