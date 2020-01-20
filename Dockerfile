FROM python:3.7.5-alpine

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
COPY ./app/requirements.txt /app/requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
        gcc libc-dev linux-headers postgresql-dev
RUN chmod +x /app/requirements.txt
RUN pip install -r requirements.txt

RUN apk del .tmp-build-deps

COPY . /app