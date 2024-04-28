#Criaçao da imagem eXperience utilizando o Dockerfile
cd /tmp
unzip experience.zip
sudo docker build -t experience .
sudo docker run -d -it --name experience -p 9090:8080 --privileged experience:latest /usr/sbin/init
