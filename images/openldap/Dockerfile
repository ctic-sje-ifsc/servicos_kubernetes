FROM alpine:3.6
MAINTAINER Ederson Torresini <boidacarapreta@gmail.com>

ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="CTIC-SJE-IFSC Kubernetes: OpenLDAP server" \
      org.label-schema.description="Nuvem privada do Câmpus São José do IFSC" \
      org.label-schema.license="MIT" \
      org.label-schema.url="https://projetos.sj.ifsc.edu.br" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/ctic-sje-ifsc/kubernetes" \
      org.label-schema.vendor="CTIC" \
      org.label-schema.version="2.4.44" \
      org.label-schema.schema-version="1.0"

COPY ./docker-entrypoint.sh /
RUN chmod 0755 /docker-entrypoint.sh && \
    apk add --update openldap && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

EXPOSE 389
VOLUME ["/etc/openldap", "/var/lib/openldap"]
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/slapd", "-u", "ldap", "-d", "512", "-f", "/etc/openldap/slapd.conf"]
