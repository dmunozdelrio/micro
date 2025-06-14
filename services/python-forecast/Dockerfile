FROM python:3.8-slim

WORKDIR /app

# Instala Poetry
RUN pip install --no-cache-dir poetry

# Copia config y lock file
COPY pyproject.toml poetry.lock /app/

# Instala solo dependencias de producción (excluye grupo dev)
RUN poetry config virtualenvs.create false \
    && poetry install --without dev --no-interaction --no-ansi

# Copia el código fuente
COPY src ./src

EXPOSE 3002
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "3002"]
