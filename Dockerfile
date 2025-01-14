FROM python:3.9-alpine

ENV PYTHONUNBUFFERED 1

# update the base OS packages
RUN apk update \
  && apk upgrade \
  && apk add --no-cache --update sqlite

RUN mkdir /app
WORKDIR /

ADD requirements.txt /app
RUN pip install -r app/requirements.txt

# install the python requirements
RUN pip install --no-cache-dir -U pip pip-tools \
  && pip-sync --pip-args "--no-cache-dir" app/requirements.txt

ADD . /app

WORKDIR /app
RUN python manage.py migrate
RUN demo_data/import.sh

EXPOSE 9000
CMD python manage.py runserver 0.0.0.0:9000
