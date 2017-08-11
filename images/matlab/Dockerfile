FROM centos:centos7
MAINTAINER Ederson Torresini <boidacarapreta@gmail.com>

RUN yum -y update && \
    yum -y install openssh-server && \
    yum -y install libXext libXt mesa-libGL mesa-libGLU && \
    mkdir /var/run/sshd && \
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' && \
    ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' && \
    yum clean all

CMD ["/usr/sbin/sshd", "-D"]
