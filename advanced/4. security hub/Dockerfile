FROM python:3.6-alpine

RUN apk add --no-cache libxml2 libxml2-dev libxslt-dev gcc build-base --virtual build-dependencies \
    && pip install pytest \
    && pip install coverage \
    && pip install nose \
    && pip install nose-parameterized \
    && pip install lxml \
    && pip install isodate \
    && pip install pytz \
    && apk del build-dependencies build-base gcc