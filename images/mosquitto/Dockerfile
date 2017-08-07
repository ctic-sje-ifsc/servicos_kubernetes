# Baseado em https://github.com/mluis/docker-mosquitto-ws-alpine

FROM alpine:3.6

MAINTAINER Ederson Torresini <boidacarapreta@gmail.com>

ADD docker-entrypoint.sh /usr/bin/

RUN mkdir -p src && \
    cd src && \
    apk add --update build-base git openssl-dev c-ares-dev util-linux-dev libwebsockets-dev && \
    git clone https://github.com/eclipse/mosquitto.git && \
    cd mosquitto && \
    git checkout tags/v1.4.14 && \
    sed -i.bak s/WITH_WEBSOCKETS:=no/WITH_WEBSOCKETS:=yes/g config.mk && \
    sed -i.bak s/WITH_DOCS:=yes/WITH_DOCS:=no/g config.mk && \
    make && \
    find . -type f | grep Makefile | xargs grep -r -- --strip-program  | awk {'print $1'} | cut -d : -f 1 | xargs sed -i 's/--strip-program=\${CROSS_COMPILE}\${STRIP}//g' && \
    sed -i 's/set -e; for d in ${DOCDIRS}; do $(MAKE) -C $${d} install; done//g' Makefile  && \
    make install && \
    adduser -s /bin/false -D -H mosquitto && \
    cd / && \
    rm -rf src && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* && \
    chmod 0755 /usr/bin/docker-entrypoint.sh && \
    mkdir -p /mosquitto/config /mosquitto/data && \
    chown -R mosquitto:mosquitto /mosquitto

VOLUME ["/mosquitto/config", "/mosquitto/data"]

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

CMD ["/usr/local/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
