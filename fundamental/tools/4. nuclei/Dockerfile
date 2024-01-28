FROM python:3.12.1-alpine3.19

WORKDIR /app

COPY requirements.txt app.py /app/
RUN pip install -r requirements.txt

EXPOSE 8080
CMD ["python3", "app.py"]