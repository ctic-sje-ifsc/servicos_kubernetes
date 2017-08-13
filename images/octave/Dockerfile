FROM debian:stretch
MAINTAINER Gabriel de Souza <souzagaabriel@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y -q upgrade && \
    echo 'deb http://packages.x2go.org/debian stretch main' >> /etc/apt/sources.list.d/x2go.list && \
    echo 'deb-src http://packages.x2go.org/debian stretch main' >> /etc/apt/sources.list.d/x2go.list && \
    apt-get -y -q install xterm curl gnupg apt-utils && \
    curl 'https://pgp.mit.edu/pks/lookup?op=get&search=0xE1F958385BFE2B6E' | apt-key add - && \
    apt-get update && \
    apt-get -y -q install --no-install-recommends \
    octave-communications \
    octave-control \
    octave-parallel \
    octave-signal \
    octave-statistics \
    openssh-server \
    x2go-keyring \
    x2goserver \
    x2goserver-xsession && \
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
