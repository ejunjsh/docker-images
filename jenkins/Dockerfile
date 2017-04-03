FROM ubuntu:14.04

MAINTAINER ejunjsh <sjj050121014@163.com>

WORKDIR /root

# install openssh-server, openjdk and wget
RUN apt-get update 
RUN apt-get install -y openssh-server openjdk-7-jdk wget vim

# install tomcat
RUN wget http://apache.fayea.com/tomcat/tomcat-7/v7.0.76/bin/apache-tomcat-7.0.76.tar.gz && \
    tar -xzvf apache-tomcat-7.0.76.tar.gz && \
    mv apache-tomcat-7.0.76  /usr/local/tomcat && \
    rm apache-tomcat-7.0.76.tar.gz
RUN wget http://mirrors.jenkins-ci.org/war-stable/latest/jenkins.war
RUN mkdir -p /opt/tomcat/ && cp jenkins.war /opt/tomcat/
RUN rm jenkins.war
# set environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64 
ENV PATH=$PATH:/usr/local/tomcat/bin 
ENV CATALINA_HOME=/usr/local/tomcat
ENV CATALINA_BASE=/opt/tomcat
# copy config 
COPY ./config/ /opt/tomcat/
# ssh without key
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

CMD [ "sh", "-c", "service ssh start; startup.sh; bash" ]
