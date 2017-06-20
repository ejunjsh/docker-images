#!/bin/bash
# start elasticsearch container

N=3
N=$(( $N + 1 ))
i=1
while [ $i -lt $N ]
do
        sudo docker rm -f ec-master$i &> /dev/null
        sleep 1
        echo "start ec-master$i container..."
        sudo docker run -itd \
                --net=hadoop \
                --name ec-master$i \
                --hostname ec-master$i \
                -p 920$(( $i - 1 )):9200   \
                --privileged=true \
                jackshao/elasticsearch:1.0 &> /dev/null
        sleep 1 
        i=$(( $i + 1 ))
done
sleep 1
sudo docker exec -it ec-master1 bash
