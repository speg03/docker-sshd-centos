docker-sshd-centos
==================

Info
----

This is a docker image running sshd on latest CentOS.

Notice
------

**Do NOT `docker pull` this image.**

This image on the Docker Hub has some problems about docker user's permissions. Please build it on your local machine.

Usage
-----

```text
git clone https://github.com/speg03/docker-sshd-centos.git
cd docker-sshd-centos
docker build --no-cache -t speg03/sshd-centos .

docker run -dp 2222:22 speg03/sshd-centos
docker cp `docker ps -lq`:/home/docker/.ssh/id_rsa_docker ~/.ssh/

ssh -i ~/.ssh/id_rsa_docker -l docker -p 2222 localhost
```
