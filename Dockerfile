FROM alpine:latest
LABEL MAINTAINER="https://github.com/aenoshrajora/Ghost-Phish"
WORKDIR /ghost-phish/
ADD . /ghost-phish
RUN apk add --no-cache bash ncurses curl unzip wget php 
CMD "./ghost-phish.sh"
