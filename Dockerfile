FROM jenkins:latest

USER root
RUN usermod -aG root jenkins

USER root