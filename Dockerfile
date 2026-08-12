FROM python:3.12-slim

WORKDIR /app

COPY hello.py .

ENV PYTHONUNBUFFERED=1

CMD ["python3", "hello.py"]
