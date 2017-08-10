FROM centos:centos7
MAINTAINER Ederson Torresini <boidacarapreta@gmail.com>

ADD docker-entrypoint.sh /usr/bin/
RUN chmod 0755 /usr/bin/docker-entrypoint.sh && \
    yum -y update && \
    yum -y install openssh-server && \
    mkdir /var/run/sshd && \
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' && \
    yum clean all

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]
