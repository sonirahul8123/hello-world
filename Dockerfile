# Pull base image 
FROM tomcat:8

# Maintainer 
MAINTAINER "soni.rahul073@gmail.com" 
COPY target/webapp/*.war /usr/local/tomcat/webapps/
