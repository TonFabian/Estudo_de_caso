# Stage de construção
FROM python:3.9-slim-buster AS builder

WORKDIR /app

# Copia apenas o requirements.txt para otimizar o cache
COPY requirements.txt .

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código
COPY . .

# Stage de execução
FROM python:3.9-slim-buster

WORKDIR /app

# Copia o conteúdo do stage de builder
COPY --from=builder /app .

# Define as variáveis de ambiente
ENV FLASK_APP=todo/run.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_ENV=development

# Expondo a porta
EXPOSE 5000

# Comando para iniciar a aplicação Flask
CMD ["flask", "run"]

# Healthcheck
HEALTHCHECK CMD curl --fail http://localhost:5000/health || exit 1

