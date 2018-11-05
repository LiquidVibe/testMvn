FROM jenkins:latest

ARG network='jenkins-${BUILD_NUMBER}'
ARG seleniumHub='selenium-hub-${BUILD_NUMBER}'
ARG chrome='chrome-${BUILD_NUMBER}'
ARG firefox='firefox-${BUILD_NUMBER}'

USER root
RUN apt-get update && apt-get install -y apt-transport-https

RUN apt-get install -y apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
RUN apt-get update
RUN apt-get install -y docker-ce
RUN sudo docker pull docker/compose -y apt-transport-https
RUN sudo docker-compose up -d

USER jenkins