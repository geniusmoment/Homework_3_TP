FROM python:3.13-slim

WORKDIR /app

RUN mkdir /data

COPY generate.py .

CMD [ "python", "generate.py", "/data" ]