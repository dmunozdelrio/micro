# Camunda Workflow Engine

This directory contains a Dockerfile for running the Camunda BPM platform. The container exposes **port 8080**.

## Docker

Build and run the container:

```bash
cd tools/workflow-camunda
docker build -t workflow-camunda .
docker run -p 8080:8080 workflow-camunda
```

The Camunda web interface will be reachable at `http://localhost:8080`.
