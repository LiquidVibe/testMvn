FROM anapsix/alpine-java
LABEL maintainer="Brent Bentein"
ARG PROJECT_PATH
VOLUME $PROJECT_PATH
WORKDIR $PROJECT_PATH

COPY /target/dockerMvnRepo-1.0.0.jar /home/dockerMvnRepo-1.0.0.jar
CMD ["java","-jar","/home/dockerMvnRepo-1.0.0.jar"]