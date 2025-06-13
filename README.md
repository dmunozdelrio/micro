# Micro Frontend with Vite

This repository is linked to this article [MFE](https://dev.to/mairouche/setup-a-micro-frontend-architecture-in-15min-with-vite-4pbg).
The `host/` folder contains the Micro Frontend Shell with Vite Vanilla.
The `apps/` folder contains the microfrontends modules (angular is not working at this stage but will be added in a later commit).

Each of these folders is a standalone npm package with its own `package.json`. The repository root does **not** contain a `package.json`.

> **Warning**
> Running `npm` commands from the root directory will fail. Always navigate to the correct package folder (`apps/header`, `apps/trending` or `host`) before installing dependencies or running scripts.

To start the application, follow the steps.

## Step 1 : Build the Vue Header micro frontend

```bash
cd apps/header
npm install
npm run build
```

## Step 2 : Build the React Trending micro frontend

```bash
cd apps/trending
npm install
npm run build
```

> **Note:** After modifying any source files or CSS in `header` or `trending`,
> run `npm run build` inside each app again before serving the host.

## Step 3 : Build and run the Shell

```bash
cd host
npm install
npm run dev
```

Finally, you'll be able to see our micro frontend overall application on http://localhost:3000/

---

## Docker orchestration

If you prefer to run the entire host inside a container, use the included Dockerfile and service in `docker-compose.yml`.

```bash
docker-compose up --build host
```

This command compiles `header`, `trending`, and the host in a multi-stage build, then serves the `dist` folder on port `3000`.

> **Tip**
> The development server uses port `5173` (see `host/vite.config.js`), but the Docker container exposes `3000` for consistency with the other services.

## ERP Integration

The repository now includes Docker compose files under `deploy/` for databases, services and tooling. Microservices live under `services/` while auxiliary containers (Keycloak, RabbitMQ, MLflow, etc.) are provided in `tools/`. A mapping of each service to its database can be found in `docs/databases-map.md`.

CI workflows reside in `.github/workflows/` and a placeholder `apps/backend` directory has been added for future backend modules.

### Running with Docker Compose

To start core infrastructure and services locally:

```bash
docker compose -f deploy/docker-compose.core.yml -f deploy/docker-compose.services.yml up -d
```

Add `-f deploy/docker-compose.tools.yml` to include optional tooling such as Keycloak and Airflow.

### VoIP Integration Roadmap

The [`docs/voip-roadmap.md`](docs/voip-roadmap.md) document provides a forward-thinking plan to deploy a self-hosted voice service alongside the existing microservices. It covers PoC steps, the MVP architecture and long term scaling ideas.
