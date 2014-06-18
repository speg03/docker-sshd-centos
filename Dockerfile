# speg03/sshd-centos
#
# VERSION  0.0.1

FROM centos
MAINTAINER Takahiro Yano <speg03@gmail.com>

RUN yum install -y openssh-server sudo

RUN useradd docker
RUN passwd -uf docker

WORKDIR /home/docker

RUN mkdir .ssh
ADD id_rsa_docker .ssh/id_rsa_docker
ADD id_rsa_docker.pub .ssh/authorized_keys
RUN chown -R docker:docker .ssh && chmod 0700 .ssh && chmod 0600 .ssh/*

RUN echo "docker  ALL=(ALL) ALL" >>/etc/sudoers.d/docker

RUN /etc/init.d/sshd start
RUN /etc/init.d/sshd stop

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
