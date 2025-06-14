FROM mysql:8

# Add init scripts to be executed by the MySQL entrypoint
COPY init-scripts/01-init-databases.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/01-init-databases.sh

EXPOSE 3306
