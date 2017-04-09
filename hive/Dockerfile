FROM ubuntu:14.04

MAINTAINER ejunjsh <sjj050121014@163.com>

WORKDIR /root

# install openssh-server, openjdk and wget
RUN apt-get update 
RUN apt-get install -y openssh-server openjdk-7-jdk wget vim

# install zookeeper 3.4.9
RUN wget http://mirror.bit.edu.cn/apache/hive/hive-2.1.1/apache-hive-2.1.1-bin.tar.gz && \
    tar -xvf  apache-hive-2.1.1-bin.tar.gz && \
    mv apache-hive-2.1.1-bin  /usr/local/hive && \
    rm apache-hive-2.1.1-bin.tar.gz

# set environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64 
ENV PATH=$PATH:/usr/local/hive/bin 

# copy config 
#COPY ./config/create-myid.sh /root/
#COPY ./config/zoo.cfg /usr/local/zookeeper/conf/

RUN mkdir -p /var/lib/zookeeper/

# ssh without key
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

CMD [ "sh", "-c", "service ssh start; bash"]

