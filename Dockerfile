# Dockerfile
# Base image
FROM python:3.6
# Copy test project files to the image folder
COPY . /frontend-integration-tests
# Make the folder as a working directory
WORKDIR /frontend-integration-tests