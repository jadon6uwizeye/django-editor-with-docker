# pull the official base image
FROM python:3.8.3-alpine

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip 
COPY ./requirements.txt /usr/src/app
RUN pip install -r requirements.txt

# copy project
COPY . /usr/src/app

# collect static files
RUN python manage.py collectstatic --noinput

# run gunicorn
CMD gunicorn martor_demo/martor_demo.wsgi:application --bind 0.0.0.0:$PORT