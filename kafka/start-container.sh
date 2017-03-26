#!/bin/bash
# start kafka container
N=`cat nodes`
N=$(( $N + 1 ))
i=1
while [ $i -lt $N ]
do
    sudo docker rm -f kafka$i &> /dev/null
    i=$(( $i + 1 ))
    sleep 3
done
i=1
while [ $i -lt $N ]
do
        echo "start kafka$i container..."
        sudo docker run -itd \
                --net=hadoop \
                --name kafka$i \
                --hostname kafka$i \
                jackshao/kafka:1.0 &> /dev/null
        sleep 1
        sudo docker exec  kafka$i sh ./create-broker-id.sh $i
        sudo docker exec -d kafka$i kafka-server-start.sh /usr/local/kafka/config/server.properties 
        i=$(( $i + 1 ))
done
sleep 1
sudo docker exec -it kafka1 bash
