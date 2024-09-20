# Usar uma imagem base oficial do Python
FROM python:3.9-slim-buster

# Definir o diretório de trabalho
WORKDIR /app

# Copiar o arquivo de dependências para o contêiner
COPY requirements.txt .

# Instalar as dependências e limpar cache para reduzir o tamanho da imagem
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    pip cache purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /root/.cache/pip

# Copiar o restante do código da aplicação para o contêiner
COPY . .

# Definir variáveis de ambiente
ENV FLASK_APP=todo_project/run.py
ENV FLASK_RUN_HOST=0.0.0.0

# Expor a porta em que o Flask será executado
EXPOSE 5000

# Comando para iniciar o servidor Flask
CMD ["flask", "run"]

