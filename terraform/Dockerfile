FROM python:3.10-slim

WORKDIR /app

COPY app.py .
COPY templates/ templates/
COPY static/ static/

RUN pip install flask

EXPOSE 5050

CMD ["python", "app.py"]
