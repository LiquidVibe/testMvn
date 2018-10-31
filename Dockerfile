FROM anapsix/alpine-java
LABEL maintainer="Brent Bentein"
COPY /target/dockerMvnRepo-1.0.0.jar /home/dockerMvnRepo-1.0.0.jar
CMD ["java","-jar","/home/dockerMvnRepo-1.0.0.jar"]