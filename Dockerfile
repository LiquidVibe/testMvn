FROM jenkins

USER root
RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/*
RUN apt-get udpate
RUN apt-get install docker-ce
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins