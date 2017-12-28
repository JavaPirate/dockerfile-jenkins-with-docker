FROM jenkins/jenkins:alpine
 
USER root

#Add repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update

#Install docker-engine
RUN apk add docker

RUN apk add sudo
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# If use dockerfile-maven-plugin maybe need add jenkins to docker group
# Grant the host's group id by cat /etc/group
#RUN apk add shadow
#RUN groupmod -g 994 docker
#RUN usermod -a -G docker jenkins

USER jenkins

#Alias "docker" command
RUN echo "alias docker='sudo docker '" >> ~/.bashrc