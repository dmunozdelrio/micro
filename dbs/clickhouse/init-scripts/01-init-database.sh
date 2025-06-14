#!/bin/bash
set -e

echo "ClickHouse custom initialization script started."

# The ClickHouse Docker image's entrypoint script already handles:
# - Creation of CLICKHOUSE_DB if defined.
# - Creation of CLICKHOUSE_USER with CLICKHOUSE_PASSWORD if defined and CLICKHOUSE_DEFAULT_ACCESS_MANAGEMENT=1.

# This script can be used for additional initializations if needed.
# For example, creating specific tables or other users.

if [ -n "$CLICKHOUSE_DB" ]; then
    echo "Ensuring database '$CLICKHOUSE_DB' is handled by ClickHouse entrypoint."
    # Example of how to run a query if needed:
    # clickhouse-client -u "${CLICKHOUSE_USER:-default}" --password "${CLICKHOUSE_PASSWORD}" --query="CREATE DATABASE IF NOT EXISTS ${CLICKHOUSE_DB_OTHER};"
else
    echo "CLICKHOUSE_DB variable not set."
fi

echo "ClickHouse custom initialization script completed."
