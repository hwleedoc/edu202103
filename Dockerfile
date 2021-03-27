#layer1
FROM centos:8

#metadata
MAINTAINER hwleedoc
LABEL "purpos"="TEST"

#layer2
RUN yum install httpd -y
#layer3
ADD test.html /var/www/html/
####### root dir 

#..
WORKDIR /var/www/html
#.. #redirect out to test2.html
RUN ["/bin/bash", "-c", "echo hello >> test2.html"]
RUN ["/bin/bash", "-c", "echo $PATH >> test3.html"]
#..
EXPOSE 80
#.. ##apache command. daemon running on foreground
CMD apachectl -DFOREGROUND



