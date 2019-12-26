FROM python:3.7.5-buster

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
COPY ./app/requirements.txt /app/requirements.txt
RUN chmod +x /app/requirements.txt
RUN pip install -r requirements.txt

COPY . /app