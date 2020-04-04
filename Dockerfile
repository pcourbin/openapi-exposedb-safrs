FROM python:3-alpine
LABEL maintainer="pierre.courbin@gmail.com"

ARG safrs_version=2.7.0

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apk add git

RUN git clone --branch $safrs_version https://github.com/thomaxxl/safrs \
  && cd safrs \
  && pip install -r requirements.txt \
  && python3 setup.py install

WORKDIR /usr/src/app/safrs/expose_existing

COPY ./safrs.sh ./safrs.sh
RUN chmod +x ./safrs.sh
EXPOSE 3000
ENTRYPOINT ["./safrs.sh"]
