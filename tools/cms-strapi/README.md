# Strapi CMS

This directory provides a simple Docker setup for running a Strapi headless CMS. The container exposes **port 1337**.

## Docker

Build and run the container:

```bash
cd tools/cms-strapi
docker build -t cms-strapi .
docker run -p 1337:1337 cms-strapi
```

The Strapi admin will be available at `http://localhost:1337/admin`.
