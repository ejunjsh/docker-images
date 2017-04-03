#!/bin/bash
# start mysql container
        echo "start mysql container..."
        sudo docker run -itd \
                --net=hadoop \
                --name mysql \
                --hostname mysql \
                -p 3306:3306 \
                jackshao/mysql:1.0 &> /dev/null
        sleep 1
sudo docker exec -it mysql bash
