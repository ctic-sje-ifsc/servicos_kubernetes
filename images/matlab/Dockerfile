FROM centos:centos7
MAINTAINER Ederson Torresini <boidacarapreta@gmail.com>

RUN yum -y update && \
    yum -y install openssh-server && \
    mkdir /var/run/sshd && \
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' && \
    yum clean all

CMD ["/usr/sbin/sshd", "-D"]
