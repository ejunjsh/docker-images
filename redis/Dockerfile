FROM ubuntu:14.04

MAINTAINER junjie shao  <sjj050121014@163.com>

WORKDIR /root

# install openssh-server, openjdk and wget
RUN apt-get update && apt-get install -y openssh-server gcc wget vim make host

# install spark
RUN wget http://download.redis.io/releases/redis-3.2.6.tar.gz && \
    tar -xzvf redis-3.2.6.tar.gz && \
    mv redis-3.2.6  /usr/local/redis && \
    rm redis-3.2.6.tar.gz

# make redis binary
RUN cd /usr/local/redis && \
    make

RUN apt-get install -y ruby-full  && gem install redis

COPY ./config/redis.conf /usr/local/redis/
COPY ./config/start-redis-cluster.sh /root/

ENV PATH=$PATH:/usr/local/redis/src/

# ssh without key
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

CMD [ "sh", "-c", "service ssh start && /usr/local/redis/src/redis-server /usr/local/redis/redis.conf && bash"]

