# Official Python runtime
FROM python:3.12-slim

# Working directory inside the container
WORKDIR /app

# Copy application files
COPY hello.py .

# Run application when container starts
CMD ["python3", "hello.py"]
