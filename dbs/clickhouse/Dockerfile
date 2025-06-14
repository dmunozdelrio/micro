FROM clickhouse/clickhouse-server:22.9

# Add init script for ClickHouse DB setup
COPY init-scripts/01-init-database.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/01-init-database.sh

EXPOSE 9000 8123
