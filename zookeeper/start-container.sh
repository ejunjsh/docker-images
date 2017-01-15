#!/bin/bash
# start zookeeper container
N=`cat nodes`
N=$(( $N + 1 ))
i=1
while [ $i -lt $N ]
do
        sudo docker rm -f zk$i &> /dev/null
        sleep 1
        echo "start zk$i container..."
        sudo docker run -itd \
                --net=hadoop \
                --name zk$i \
                --hostname zk$i \
                jackshao/zookeeper:1.0 &> /dev/null
        sleep 1
        sudo docker exec -it zk$i sh ./create-myid.sh $i
        i=$(( $i + 1 ))
done
sleep 1
sudo docker exec -it zk1 bash
