FROM ubuntu:16.04

# Install Docker CLI in the agent
LABEL maintainer="Brent Bentein"

RUN apt-get update && apt-get install -y docker-ce --allow-unauthenticated
RUN apt-get update && apt-get install -y openjdk-8-jre curl python python-pip git