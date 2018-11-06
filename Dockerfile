FROM jenkins:latest

USER root
RUN sudo usermod -aG root jenkins

USER jenkins