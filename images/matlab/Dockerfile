FROM debian:stretch
MAINTAINER Gabriel de Souza <souzagaabriel@gmail.com> e João Pedro Menegali Salvan Bitencourt <jpcatarinense@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -q -y upgrade && \
    echo 'deb http://packages.x2go.org/debian stretch main' >> /etc/apt/sources.list.d/x2go.list && \
    echo 'deb-src http://packages.x2go.org/debian stretch main' >> /etc/apt/sources.list.d/x2go.list && \
    apt-get -q -y install x2go-keyring apt-utils && \
    apt-get update && \
    apt-get -q -y install --no-install-recommends openssh-server x2goserver x2goserver-xsession libglu1-mesa && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /var/run/sshd

# Based on:
# https://docs.docker.com/engine/examples/running_ssh_service/
# https://github.com/theodotos/debian-ssh-docker

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
