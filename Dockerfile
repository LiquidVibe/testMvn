FROM jenkins:latest

USER root
RUN apt-get update && apt-get install -y apt-transport-https

RUN apt-get install -y apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
RUN apt-get install -y docker-ce
RUN groupadd docker && gpasswd -a jenkins docker
RUN curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` \
    >~/docker-compose
RUN chmod +x ~/docker-compose
RUN mv ~/docker-compose /usr/local/bin/docker-compose
USER jenkins