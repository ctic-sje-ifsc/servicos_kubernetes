FROM centos:centos7
MAINTAINER Ederson Torresini <boidacarapreta@gmail.com>

RUN yum -y update && \
    yum -y install openssh-server && \
    yum -y install libXext libXt mesa-libGL mesa-libGLU xorg-x11-xauth && \
    mkdir /var/run/sshd && \
    ssh-keygen -b 2048 -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' && \
    ssh-keygen -b 2048 -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' && \
    yum clean all

CMD ["/usr/sbin/sshd", "-D"]
