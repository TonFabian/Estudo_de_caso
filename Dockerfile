# Stage de construção
FROM python:3.9-slim-buster-slim AS builder

WORKDIR /app

COPY requirements.txt requirements.txt.lock .

RUN pip install --no-cache-dir -r requirements.txt && \
    pip cache purge

COPY . .

# Stage de execução
FROM python:3.9-slim-buster-slim

WORKDIR /app

COPY --from=builder /app .

ENV FLASK_APP=todo_project/run.py
ENV FLASK_RUN_HOST=0.0.0.0

EXPOSE 5000

CMD ["flask", "run"]

# Healthcheck (Exemplo)
HEALTHCHECK CMD curl --fail http://localhost:5000/health || exit 1
