FROM postgres:15

COPY init-scripts/01-init-databases.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/01-init-databases.sh

EXPOSE 5432
