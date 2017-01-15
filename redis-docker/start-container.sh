#!/bin/bash
# start redis container
N=$1
N=$(( $N + 1 ))
i=1
while [ $i -lt $N ]
do
        sudo docker rm -f redis$i &> /dev/null
        sleep 1 
        echo "start redis$i container..."
        sudo docker run -itd \
                --net=hadoop \
                --name redis$i \
                --hostname redis$i \
                jackshao/redis:1.0 &> /dev/null
        i=$(( $i + 1 ))
done
sleep 1
sudo docker exec -it redis1 bash
