# Pull base image 
FROM tomcat:8

# Install docker client for accessing docker inside docker container
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-18.06.1-ce.tgz \
  && tar -xzvf docker-18.06.1-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-18.06.1-ce.tgz

# Maintainer 
MAINTAINER "soni.rahul073@gmail.com" 
COPY target/*.war /usr/local/tomcat/webapps
