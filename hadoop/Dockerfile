FROM ubuntu:16.04

MAINTAINER ejunjsh <sjj050121014@163.com>

WORKDIR /root

# install openssh-server, openjdk and wget
RUN echo v1 && apt-get update 
RUN apt-get install -y openssh-server openjdk-8-jdk wget vim

# install hadoop 2.7.3
RUN wget http://mirrors.cnnic.cn/apache/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz && \
    tar -xzvf hadoop-2.7.3.tar.gz && \
    mv hadoop-2.7.3 /usr/local/hadoop && \
    rm hadoop-2.7.3.tar.gz
RUN wget http://mirror.bit.edu.cn/apache/hive/hive-1.2.2/apache-hive-1.2.2-bin.tar.gz && \
    tar -xvf  apache-hive-1.2.2-bin.tar.gz && \
    mv apache-hive-1.2.2-bin  /usr/local/hive && \
    rm apache-hive-1.2.2-bin.tar.gz

RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.41.tar.gz && \
    tar -xvf mysql-connector-java-5.1.41.tar.gz && \
    mv mysql-connector-java-5.1.41/mysql* /usr/local/hive/lib/ && \
    rm -rf mysql-connector-java-5.1.41*
# set environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 
ENV HADOOP_HOME=/usr/local/hadoop 
ENV PATH=$PATH:/usr/local/hive/bin:/usr/local/hadoop/bin:/usr/local/hadoop/sbin 

# ssh without key
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

RUN mkdir -p ~/hdfs/namenode && \ 
    mkdir -p ~/hdfs/datanode && \
    mkdir $HADOOP_HOME/logs

COPY config/* /tmp/

RUN mv /tmp/ssh_config ~/.ssh/config && \
    mv /tmp/hadoop-env.sh /usr/local/hadoop/etc/hadoop/hadoop-env.sh && \
    mv /tmp/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml && \ 
    mv /tmp/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml && \
    mv /tmp/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml && \
    mv /tmp/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml && \
    mv /tmp/slaves $HADOOP_HOME/etc/hadoop/slaves && \
    mv /tmp/start-hadoop.sh ~/start-hadoop.sh && \
    mv /tmp/run-wordcount.sh ~/run-wordcount.sh && \
    mv /tmp/start-dfs-yarn.sh ~/start-dfs-yarn.sh && \
    mv /tmp/hive-site.xml /usr/local/hive/conf/

RUN chmod +x ~/start-hadoop.sh && \
    chmod +x ~/run-wordcount.sh && \
    chmod +x ~/start-dfs-yarn.sh && \
    chmod +x $HADOOP_HOME/sbin/start-dfs.sh && \
    chmod +x $HADOOP_HOME/sbin/start-yarn.sh 

# format namenode
RUN /usr/local/hadoop/bin/hdfs namenode -format

CMD [ "sh", "-c", "service ssh start; ./start-dfs-yarn.sh ;bash"]

