FROM python:3.13-slim

WORKDIR /app

COPY lambda_function.py /app/lambda_function.py

CMD ["python", "-c", "from lambda_function import lambda_handler; print(lambda_handler({}, None))"]
