FROM jenkins

USER root
RUN apt-get update
RUN apt-get -y install apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common
RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable"
RUN apt-get update
RUN apt-get -y install docker-ce
RUN docker ps
RUN docker pull selenium/hub:latest
RUN docker pull selenium/node-chrome-debug:latest
RUN docker run -d -p 4444:4444 --name selenium-hub -P selenium/hub
RUN docker run -d -p 4578 --name chrome --link selenium-hub:hub selenium/node-chrome-debug

USER jenkins