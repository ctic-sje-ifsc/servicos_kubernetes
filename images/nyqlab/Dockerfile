# Baseado em:
# - https://github.com/rwnobrega/nyqlab

FROM debian:stretch
MAINTAINER Ederson Torresini <boidacarapreta@gmail.com>

ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="CTIC-SJE-IFSC Kubernetes: Nyqlab" \
      org.label-schema.description="Nuvem privada do Câmpus São José do IFSC" \
      org.label-schema.license="GPLv2" \
      org.label-schema.url="https://projetos.sj.ifsc.edu.br" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/ctic-sje-ifsc/kubernetes" \
      org.label-schema.vendor="CTIC" \
      org.label-schema.version="1.0" \
      org.label-schema.schema-version="1.0"

ENV DEBIAN_FRONTEND noninteractive
COPY ./docker-entrypoint.sh /
RUN chmod 0755 /docker-entrypoint.sh && \
    apt update && \
    apt -y upgrade && \
    echo 'deb http://packages.x2go.org/debian stretch main' >> /etc/apt/sources.list.d/x2go.list && \
    echo 'deb-src http://packages.x2go.org/debian stretch main' >> /etc/apt/sources.list.d/x2go.list && \
    apt-get -y -q install curl gnupg apt-utils && \
    curl 'https://pgp.mit.edu/pks/lookup?op=get&search=0xE1F958385BFE2B6E' | apt-key add - && \
    apt-get update && \
    apt-get -y -q install openssh-server x2go-keyring x2goserver x2goserver-xsession libglu1-mesa && \
    apt -y install git && \
    git clone --depth 1 https://github.com/rwnobrega/nyqlab && \
    apt -y install python3 python3-numpy python3-matplotlib python3-pyqt5 python3-scipy && \
    apt-get -y -q install libnss-ldap libpam-ldap ldap-utils nscd && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir /var/run/sshd

EXPOSE 22
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]
