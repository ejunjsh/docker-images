#!/bin/bash
# start zookeeper container
        sudo docker rm -f zk$1 &> /dev/null
        sleep 1
        echo "start zk$1 container..."
        sudo docker run -itd \
                --net=hadoop \
                --name zk$1 \
                --hostname zk$1 \
                -e myid=$1  \
                jackshao/zookeeper:1.0 &> /dev/null
        sleep 2
sudo docker exec -it zk$1 bash
