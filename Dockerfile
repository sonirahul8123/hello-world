# Pull base image 
FROM tomcat:8

# Maintainer 
MAINTAINER "soni.rahul073@gmail.com" 
COPY target/*.war /usr/local/tomcat/webapps
