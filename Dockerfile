FROM python:2.7-alpine

COPY requirements.txt /

RUN apk add --update --no-cache g++ gcc libxslt-dev
RUN pip install -U pip
RUN pip install -r /requirements.txt

COPY . /app

WORKDIR /app

RUN export PYTHONPATH=/app:$PYTHONPATH
RUN python setup.py install

CMD [ "python", "/app/bin/test.py" ]