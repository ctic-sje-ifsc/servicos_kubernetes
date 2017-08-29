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
    apt -y install git && \
    git clone --depth 1 https://github.com/rwnobrega/nyqlab && \
    apt -y install python3 python3-numpy python3-matplotlib python3-pyqt5 python3-scipy && \
    apt -y install ssh && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir /var/run/sshd

EXPOSE 22
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]
