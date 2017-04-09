#!/bin/bash
# start hive container
        echo "start hive container..."
        sudo docker run -itd \
                --net=hadoop \
                --name hive \
                --hostname hive \
                jackshao/hive:1.0 &> /dev/null
        sleep 1
sudo docker exec -it hive bash
