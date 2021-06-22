FROM alpine:latest

WORKDIR /jobs

RUN apk update

RUN apk upgrade

EXPOSE 80