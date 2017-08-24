# Baseado em https://github.com/mluis/docker-mosquitto-ws-alpine

FROM alpine:3.6
MAINTAINER Ederson Torresini <boidacarapreta@gmail.com>

ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="CTIC-SJE-IFSC Kubernetes: Mosquitto MQTT broker" \
      org.label-schema.description="Nuvem privada do Câmpus São José do IFSC" \
      org.label-schema.license="epl-v10" \
      org.label-schema.url="https://projetos.sj.ifsc.edu.br" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/ctic-sje-ifsc/kubernetes" \
      org.label-schema.vendor="CTIC" \
      org.label-schema.version="1.4.14" \
      org.label-schema.schema-version="1.0"

COPY ./docker-entrypoint.sh /
RUN chmod 0755 /docker-entrypoint.sh && \
    apk add --update build-base git openssl-dev c-ares-dev util-linux-dev libwebsockets-dev && \
    mkdir -p src && \
    cd src && \
    git clone https://github.com/eclipse/mosquitto.git && \
    cd mosquitto && \
    git checkout tags/v1.4.14 && \
    sed -i.bak s/WITH_WEBSOCKETS:=no/WITH_WEBSOCKETS:=yes/g config.mk && \
    sed -i.bak s/WITH_DOCS:=yes/WITH_DOCS:=no/g config.mk && \
    make && \
    find . -type f | grep Makefile | xargs grep -r -- --strip-program  | awk {'print $1'} | cut -d : -f 1 | xargs sed -i 's/--strip-program=\${CROSS_COMPILE}\${STRIP}//g' && \
    sed -i 's/set -e; for d in ${DOCDIRS}; do $(MAKE) -C $${d} install; done//g' Makefile  && \
    make install && \
    cd / && \
    rm -rf src && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* && \
    mkdir -p /mosquitto/config /mosquitto/data && \
    adduser -s /bin/false -D -H mosquitto && \
    chown -R mosquitto:mosquitto /mosquitto

VOLUME ["/mosquitto/config", "/mosquitto/data"]
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/local/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
