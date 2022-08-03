FROM alpine:3.16


RUN apk add wget
RUN apk add tar
RUN apk add gzip

RUN wget -O - "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -