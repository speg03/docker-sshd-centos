# speg03/sshd-centos
#
# VERSION  0.0.1

FROM centos
MAINTAINER Takahiro Yano <speg03@gmail.com>

RUN yum install -y sudo openssh-server

RUN useradd docker
RUN passwd -uf docker
RUN mkdir -p /home/docker/.ssh
ADD id_rsa_docker.pub /home/docker/.ssh/authorized_keys

RUN chown -R docker:docker /home/docker/.ssh
RUN chmod 0700 /home/docker/.ssh
RUN chmod 0600 /home/docker/.ssh/authorized_keys

RUN echo "docker  ALL=(ALL) ALL" >>/etc/sudoers.d/docker

RUN /etc/init.d/sshd start
RUN /etc/init.d/sshd stop

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
