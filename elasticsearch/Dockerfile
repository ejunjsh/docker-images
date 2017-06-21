FROM ubuntu:16.04

MAINTAINER ejunjsh <sjj050121014@163.com>

WORKDIR /root

# install openssh-server, openjdk and wget
RUN apt-get update 
RUN apt-get install -y openssh-server openjdk-8-jdk wget vim curl

# install zookeeper 3.4.9
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.4.1.tar.gz && \
    tar -xzvf elasticsearch-5.4.1.tar.gz && \
    mv elasticsearch-5.4.1 /usr/local/ec && \
    rm elasticsearch-5.4.1.tar.gz

# set environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 
ENV PATH=$PATH:/usr/local/ec/bin 

# copy config 
COPY ./config/elasticsearch.yml /usr/local/ec/config/

RUN mkdir -p /var/lib/data/ec
RUN mkdir -p /var/log/ec

# create user
RUN useradd ec
RUN chown -R ec /usr/local/ec
RUN chown -R ec /var/lib/data/ec
RUN chown -R ec /var/log/ec
# ssh without key
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

RUN sysctl -w vm.max_map_count=262144


CMD [ "sh", "-c", "service ssh start; su - ec  /usr/local/ec/bin/elasticsearch"]

