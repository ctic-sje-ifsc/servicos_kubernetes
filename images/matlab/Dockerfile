FROM debian:stretch
MAINTAINER Gabriel de Souza <souzagaabriel@gmail.com> e João Pedro Menegali Salvan Bitencourt <jpcatarinense@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && \
    apt -y upgrade && \
    echo -e "# X2Go Repository (release builds)\ndeb http://packages.x2go.org/debian stretch main\n# X2Go Repository (sources of release builds)\ndeb-src http://packages.x2go.org/debian stretch main" >> /etc/apt/sources.list && \
    apt -y install gnupg1 && \
    apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E && \
    apt update && \
    apt -y install x2goserver && \
    mkdir /var/run/sshd && \
    apt clean all

CMD ["/usr/sbin/sshd", "-D"]
