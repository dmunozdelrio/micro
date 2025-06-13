# Service to Database Map

| Service | Database | Notes |
|---------|----------|-------|
| auth-node | PostgreSQL | Row-level security for ACL |
| sales-python | PostgreSQL + TimescaleDB | Accounting and sales time series |
| inventory-go | MongoDB | Flexible product schemas |
| crm-java | MySQL | Easy replication support |
| billing-dotnet | SQL Server | Stored procedures for invoices |
| analytics-rust | ClickHouse | Fast OLAP queries |
| swift-notifications | Redis | Low latency pub/sub |
| elixir-messaging | RabbitMQ | Persistent message queues |
| go-gateway | Redis | Token cache and rate limiting |
| python-forecast | PostgreSQL + MinIO | Predictions and datasets |
| recommender | Neo4j | Graph recommendations |
| vector-db | Qdrant/Weaviate | Semantic search |
| feature-store | Feast (PostgreSQL + Redis) | Online features for ML |
| observability | Prometheus + Loki | Metrics and logs |
