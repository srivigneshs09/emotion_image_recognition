FROM python:3.9-buster

RUN apt-get update && apt-get install -y \
    build-essential \
    libhdf5-dev \
    python3-dev \
    pkg-config \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install --upgrade pip \
    && pip install --default-timeout=1000 --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 80
EXPOSE 8080
EXPOSE 5000

CMD ["python", "application.py"]
