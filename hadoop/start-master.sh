#!/bin/bash
# start hadoop master container
sudo docker rm -f hadoop-master &> /dev/null
sleep 1
echo "start hadoop-master container..."
sudo docker run -itd \
                --net=hadoop \
                -p 50070:50070 \
                -p 8088:8088 \
                --name hadoop-master \
                -e master=1 \
                --hostname hadoop-master \
                ejunjsh/hadoop:1.0 &> /dev/null


# get into hadoop master container
sleep 3 
sudo docker exec -it hadoop-master bash
