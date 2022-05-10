FROM PYTHON:3

ENV ENVIRONMENTVARIABLE value

WORKDIR /app

ADD . /app

COPY ./requirements.txt /app/requirements.txt