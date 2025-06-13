# MeiliSearch Server

This directory contains a Dockerfile for running the MeiliSearch search service. It exposes **port 7700**.

## Docker

Build and run:

```bash
cd tools/search-meilisearch
docker build -t search-meilisearch .
docker run -p 7700:7700 search-meilisearch
```

The service will be reachable at `http://localhost:7700`.
