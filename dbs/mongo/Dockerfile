FROM mongo:6

# Add init script for DB and user
COPY init-scripts/01-init-db-and-user.js /docker-entrypoint-initdb.d/

EXPOSE 27017
