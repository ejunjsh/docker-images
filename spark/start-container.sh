#!/bin/bash
# start spark container
sudo docker rm -f spark  &> /dev/null
sleep 5
echo "start spark container..."
sudo docker run -itd \
                --net=hadoop \
                --name spark \
                --hostname spark \
                jackshao/spark:1.0 &> /dev/null

sleep 5
sudo docker exec -it spark bash
