FROM jenkins

USER root
RUN docker ps
RUN docker pull selenium/hub:latest
RUN docker pull selenium/node-chrome-debug:latest
RUN docker run -d -p 4444:4444 --name selenium-hub -P selenium/hub
RUN docker run -d -p 4578 --name chrome --link selenium-hub:hub selenium/node-chrome-debug

USER jenkins