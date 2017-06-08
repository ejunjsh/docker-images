FROM ubuntu:16.04

MAINTAINER ejunjsh <sjj050121014@163.com>

WORKDIR /root

# install openssh-server, openjdk and wget
RUN apt-get update && apt-get install -y openssh-server  wget vim scala=2.11.6-6

# install zookeeper 3.4.9
RUN wget http://mirrors.tuna.tsinghua.edu.cn/apache/kafka/0.10.2.0/kafka_2.11-0.10.2.0.tgz && \
    tar -xzvf kafka_2.11-0.10.2.0.tgz && \
    mv kafka_2.11-0.10.2.0 /usr/local/kafka && \
    rm kafka_2.11-0.10.2.0.tgz

# set environment variable
ENV JAVA_HOME=/usr 
ENV PATH=$PATH:/usr/local/kafka/bin 

# copy config 
COPY ./config/server.properties.template /usr/local/kafka/config/server.properties.template 
COPY ./config/create-broker-id.sh /root/

RUN chmod +x /root/create-broker-id.sh

RUN mkdir -p /var/lib/kafka/

# ssh without key
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

CMD [ "sh", "-c", "create-broker-id.sh;kafka-server-start.sh /usr/local/kafka/config/server.properties; bash"]

