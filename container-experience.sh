#!/bin/bash
#Instalaçao Docker Amazon Linux(CentOS)
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
systemctl start docker

#Criaçao da imagem eXperience utilizando o Dockerfile
cd /tmp
docker build -t experience .
docker run -d -it --name experience -p 9090:8080 --privileged experience:latest /usr/sbin/init
rm -rf /tmp/*