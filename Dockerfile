FROM jenkins:latest

USER root
RUN apt-get update && apt-get install -y apt-transport-https
RUN apt-get install acl -y
RUN apt-get install -y apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
RUN apt-get update
RUN apt-get install -y docker-ce
RUN gpasswd -a jenkins docker
RUN usermod -aG docker jenkins
RUN curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` \
    >~/docker-compose
RUN chmod +x ~/docker-compose
RUN mv ~/docker-compose /usr/local/bin/docker-compose
RUN service docker stop
RUN service docker start
RUN docker ps
RUN docker run --priviliged -v /var/run/docker.sock:/var/run/docker.sock docker
USER jenkins