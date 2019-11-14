from alpine:latest

RUN apk --no-cache add shadow aria2

ENV RPC_SECRET ""
ENV UID 65534
ENV GID 65534

RUN adduser -D www-data

RUN mkdir /downloads

COPY aux-files/entry.sh /entry.sh

RUN chmod +x /entry.sh

ENTRYPOINT ["entry.sh"]