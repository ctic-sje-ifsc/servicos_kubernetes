FROM debian:stretch
MAINTAINER Gabriel de Souza <souzagaabriel@gmail.com> e João Pedro Menegali Salvan Bitencourt <jpcatarinense@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y upgrade && \
    echo 'deb http://packages.x2go.org/debian stretch main' >> /etc/apt/sources.list.d/x2go.list && \
    echo 'deb-src http://packages.x2go.org/debian stretch main' >> /etc/apt/sources.list.d/x2go.list && \
    apt-get -y install gnupg1 apt-utils && \
    apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E && \
    apt-get update && \
    apt-get -y install x2go-keyring x2goserver x2goserver-xsession libglu1-mesa && \
    mkdir /var/run/sshd && \
    apt-get clean all

CMD ["/usr/sbin/sshd", "-D"]
