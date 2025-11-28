FROM python:3.12-slim

WORKDIR /bot

# System dependencies for sqlcipher3
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        gcc \
        sqlcipher \
        libsqlcipher-dev && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir sqlcipher3

COPY . .

ENV PYTHONUNBUFFERED=1

CMD ["python", "-u", "run.py"]