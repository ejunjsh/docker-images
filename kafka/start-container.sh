#!/bin/bash 
sudo docker rm -f kafka$1 &> /dev/null
        sleep 1
        echo "start kafka$1 container..."
        sudo docker run -itd \
                        --net=hadoop \
                        --name kafka$1 \
                        -e brokerid=$1 \
                        --hostname kafka$1 \
                        ejunjsh/kafka:1.0 &> /dev/null

# get into kafka container
sleep 3
sudo docker exec -it kafka$1 bash
