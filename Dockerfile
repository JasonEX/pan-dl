from alpine:latest

RUN apk --no-cache add shadow aria2

ENV RPC_SECRET ""
ENV UID 65534
ENV GID 65534

RUN groupadd -f www-data && useradd -M www-data -g www-data \
    && mkdir /conf && mkdir /downloads \
    && touch /conf/dht.dat && touch /conf/dht6.dat && touch /conf/aria2.session

COPY aux-files/entry.sh /entry.sh
COPY aux-files/aria2.conf /conf

RUN chmod +x /entry.sh

VOLUME ["/conf", "/downloads"]

EXPOSE 6800

ENTRYPOINT ["/entry.sh"]
