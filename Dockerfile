FROM jenkins:latest

USER root
RUN apt-get update
RUN groupadd docker && gpasswd -a jenkins docker
RUN curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` \
    >~/docker-compose
RUN chmod +x ~/docker-compose
RUN mv ~/docker-compose /usr/local/bin/docker-compose
USER jenkins