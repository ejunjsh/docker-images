#!/bin/bash
# start echead container
        sudo docker rm -f echead > /dev/null
        sleep 1
        echo "start echead container..."
        sudo docker run -d \
                --net=hadoop \
                --name echead \
                --hostname echead \
                -p 9100:9100   \
                jackshao/echead:1.0 > /dev/null
