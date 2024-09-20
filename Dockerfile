FROM python:3.9.20-slim

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos do projeto para o contêiner
COPY . .

# Instala as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt && \
    pip cache purge

# Expõe a porta 5000 para acesso à aplicação
EXPOSE 5000

# Define a variável de ambiente para o Flask
ENV FLASK_APP=run.py

# Comando para iniciar a aplicação Flask
CMD ["flask", "run", "--host=0.0.0.0"]

