docker-sshd-centos
==================

Info
----

This is a docker image running sshd on latest CentOS.

Notice
------

**Do NOT `docker pull` this image.**

This image on the Docker Hub has some problems about docker user's permissions now. Please build it on your local machine.

Usage
-----

My build environment
* Ubuntu 14.04 LTS
* Docker 0.9.1

```text
git clone https://github.com/speg03/docker-sshd-centos.git
cd docker-sshd-centos
docker build --no-cache -t speg03/sshd-centos .

docker run -dp 2222:22 speg03/sshd-centos
docker cp `docker ps -lq`:/home/docker/.ssh/id_rsa_docker ~/.ssh/

ssh -i ~/.ssh/id_rsa_docker -l docker -p 2222 localhost
```

The below message has shown when execute `docker cp`. This is no problems.
```
2014/06/19 12:07:27 lchown /home/yano/.ssh/id_rsa_docker: operation not permitted
```
