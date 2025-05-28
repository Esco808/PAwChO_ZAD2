# syntax=docker/dockerfile:1.6

FROM python:3.13-slim

LABEL org.opencontainers.image.authors="Paweł Ostrowski <s99649@pollub.edu.pl>"

WORKDIR /app

# Instalacja git i curl
RUN apt-get update && apt-get install -y git curl && apt-get clean

# Klonowanie repozytorium przez HTTPS
RUN git clone https://github.com/Esco808/PAwChO_ZAD1.git /app

# Instalacja zależności
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

HEALTHCHECK --interval=10s --timeout=1s --retries=3 CMD curl -f http://localhost:8000/ || exit 1

CMD ["python", "app.py"]