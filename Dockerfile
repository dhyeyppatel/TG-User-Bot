FROM python:3.12-slim

WORKDIR /app

# Install system dependencies needed for TgCrypto
RUN apt-get update && apt-get install -y \
    gcc \
    build-essential \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

# Upgrade pip (optional but recommended)
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python3", "bot.py"]
