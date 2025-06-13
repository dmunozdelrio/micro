# Apache Superset Analytics

This directory includes a Dockerfile for running Apache Superset. The container exposes **port 8088**.

## Docker

Build and run:

```bash
cd tools/analytics-superset
docker build -t analytics-superset .
docker run -p 8088:8088 analytics-superset
```

Visit `http://localhost:8088` to access the Superset UI.
