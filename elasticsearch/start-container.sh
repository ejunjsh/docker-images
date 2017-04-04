#!/bin/bash
# start elasticsearch container
sudo sysctl -w vm.max_map_count=262144
N=`cat nodes`
N=$(( $N + 1 ))
i=1
while [ $i -lt $N ]
do
        sudo docker rm -f ec$i &> /dev/null
        sleep 1
        echo "start ec$i container..."
        sudo docker run -itd \
                --net=hadoop \
                --name ec$i \
                --hostname ec$i \
                -p 920$(( $i - 1 )):9200   \
                jackshao/elasticsearch:1.0 &> /dev/null
        sleep 1 
        sudo docker exec -d  ec$i su - ec  /usr/local/ec/bin/elasticsearch
        i=$(( $i + 1 ))
done
sleep 1
sudo docker exec -it ec1 bash
