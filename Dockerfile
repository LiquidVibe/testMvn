FROM jenkins:latest

USER root
RUN apt-get update && apt-get install -y apt-transport-https

RUN apt-get install -y apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
RUN apt-get update
RUN apt-get install -y docker-ce
RUN docker run -d -p 4444:4444 --name selenium-hub -P selenium/hub
RUN docker run -d -p 4578 --name chrome --link selenium-hub:hub selenium/node-chrome-debug

USER jenkins