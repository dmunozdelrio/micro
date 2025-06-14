#!/bin/bash
set -e

# Function to create a database if it doesn't exist
create_database() {
    local db_name=$1
    echo "Checking if database '$db_name' exists for user '$POSTGRES_USER'..."
    if psql -U "$POSTGRES_USER" -lqt | cut -d \| -f 1 | grep -qw "$db_name"; then
        echo "Database '$db_name' already exists."
    else
        echo "Creating database '$db_name'..."
        psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
            CREATE DATABASE "$db_name";
EOSQL
        echo "Database '$db_name' created."
    fi
}

# POSTGRES_DB is created by the entrypoint by default if it's the first time.
# This script ensures other specific databases are also created.
if [ -n "$POSTGRES_DB" ]; then
    create_database "$POSTGRES_DB"
fi
if [ -n "$POSTGRES_DB_IDENTITY" ]; then
    create_database "$POSTGRES_DB_IDENTITY"
fi
if [ -n "$POSTGRES_DB_MESSAGING" ]; then
    create_database "$POSTGRES_DB_MESSAGING"
fi
if [ -n "$POSTGRES_DB_ACCOUNTING" ]; then
    create_database "$POSTGRES_DB_ACCOUNTING"
fi
if [ -n "$POSTGRES_DB_ORDERS" ]; then
    create_database "$POSTGRES_DB_ORDERS"
fi
if [ -n "$POSTGRES_DB_CRM" ]; then
    create_database "$POSTGRES_DB_CRM"
fi
if [ -n "$POSTGRES_DB_AIRFLOW" ]; then
    create_database "$POSTGRES_DB_AIRFLOW"
fi

echo "PostgreSQL initialization script completed."
