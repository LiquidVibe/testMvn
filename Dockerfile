FROM jenkins:latest

USER root
RUN apt-get update
RUN groupadd docker && gpasswd -a jenkins docker

USER jenkins