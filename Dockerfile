FROM jenkins/jenkins:alpine
 
USER root

#Add repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update

#Install docker-engine
RUN apk add docker

RUN apk add sudo
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER jenkins

#Alias "docker" command
RUN echo "alias docker='sudo docker '" >> ~/.bashrc