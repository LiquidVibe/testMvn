FROM jenkins

USER root
RUN apt-get update
RUN apt-get install docker-ce
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
USER jenkins