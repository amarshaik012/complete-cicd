FROM python:3.10-slim

WORKDIR /app
COPY app.py .
COPY templates/ ./templates/
COPY static/ ./static/

# Install Flask and curl
RUN pip install flask prometheus_client && apt-get update && apt-get install -y curl

EXPOSE 5050
CMD ["python", "app.py"]
