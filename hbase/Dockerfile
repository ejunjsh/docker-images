FROM ubuntu:16.04

MAINTAINER ejunjsh <sjj050121014@163.com>

WORKDIR /root

# install openssh-server, openjdk and wget
RUN echo v1 && apt-get update 
RUN apt-get install -y openssh-server openjdk-8-jdk wget vim

# install hbase 1.2.5
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/hbase/stable/hbase-1.2.5-bin.tar.gz && \
    tar -xzvf hbase-1.2.5-bin.tar.gz && \
    mv hbase-1.2.5 /usr/local/hbase && \
    rm hbase-1.2.5-bin.tar.gz

# set environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 
ENV HBASE_HOME=/usr/local/hbase 
ENV PATH=$PATH:/usr/local/hbase/bin 

# ssh without key
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

COPY config/* /tmp/

RUN mv /tmp/ssh_config ~/.ssh/config && \
    mv /tmp/hbase-site.xml $HBASE_HOME/conf/ && \
    mv /tmp/hbase-env.sh $HBASE_HOME/conf/ && \
    mv /tmp/start-hbase.sh $HBASE_HOME/bin/ && \
    mv /tmp/regionservers $HBASE_HOME/conf/


CMD [ "sh", "-c", "service ssh start; bash"]
