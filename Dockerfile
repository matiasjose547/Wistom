FROM python:3.11-slim

# Instala dependências essenciais do sistema para o Python e para o Flet
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    libgomp1 \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Atualiza o pip
RUN pip install --no-cache-dir --upgrade pip

# Copia e instala as dependências do projeto
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código para dentro do container
COPY . .

# Expõe a porta padrão que o Flet costuma utilizar para desenvolvimento web
EXPOSE 8550

# Comando padrão para iniciar a aplicação em modo de desenvolvimento web
CMD ["python", "main.py"]