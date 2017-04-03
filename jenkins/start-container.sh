#!/bin/bash
        sudo docker rm -f jenkins &> /dev/null
        sleep 1
        echo "start jenkins container..."
        sudo docker run -itd \
                --net=hadoop \
                --name jenkins \
                --hostname jenkins \
                -p 9443:9443 \
                jackshao/jenkins:1.0 &> /dev/null
        sleep 1 
sudo docker exec -it jenkins bash
