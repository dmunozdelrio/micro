#!/bin/bash
set -e

# MYSQL_DATABASE is created by the entrypoint by default.
# This script ensures other specific databases are also created.

if [ -n "$MYSQL_DATABASE" ]; then
    echo "Ensuring main database '$MYSQL_DATABASE' exists..."
    mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;"
fi

if [ -n "$MYSQL_DATABASE_ECOMMERCE" ]; then
    echo "Creating database '$MYSQL_DATABASE_ECOMMERCE' for e-commerce if it doesn't exist..."
    mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE_ECOMMERCE\`;"
fi

echo "MySQL initialization script completed."
