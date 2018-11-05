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
RUN docker pull selenium/hub
RUN docker pull selenium/node-chrome-debug
RUN docker run -d -p 4444:4444 --name selenium-hub -P selenium/hub
RUN docker run -d -P --link selenium-hub:hub selenium/node-chrome-debug

USER jenkins