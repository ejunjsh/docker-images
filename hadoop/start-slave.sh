#!/bin/bash 
sudo docker rm -f hadoop-slave$1 &> /dev/null
        sleep 1
        echo "start hadoop-slave$1 container..."
        sudo docker run -itd \
                        --net=hadoop \
                        --name hadoop-slave$1 \
                        -e slave=1 \
                        --hostname hadoop-slave$1 \
                        ejunjsh/hadoop:1.0 &> /dev/null

# get into hadoop master container
sleep 3
sudo docker exec -it hadoop-slave$1 bash
