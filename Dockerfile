FROM ubuntu:latest

USER root
RUN apt-get update && apt-get install -y apt-transport-https

RUN apt-get install -y apt-transport-https ca-certificates curl software-properties-common

RUN docker run -v /var/run/docker.sock:/var/run/docker.sock -ti docker
RUN bash service docker start
RUN docker pull selenium/hub:latest
RUN docker pull selenium/node-chrome-debug:latest
RUN docker run -d -p 4444:4444 --name selenium-hub -P selenium/hub
RUN docker run -d -p 4578 --name chrome --link selenium-hub:hub selenium/node-chrome-debug

USER jenkins