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

RUN docker network create jenkinsNetwork
RUN docker run -d -p 4444:4444 --name seleniumHub --network jenkinsNetwork selenium/hub
RUN docker run -d -e HUB_PORT_4444_TCP_ADDR=seleniumHub -e HUB_PORT_4444_TCP_PORT=4444 --network jenkinsNetwork--name chrome selenium/node-chrome

USER jenkins