#!/bin/bash

# start hbase master container
sudo docker rm -f hbase-master &> /dev/null
sleep 1
echo "start hbase-master container..."
sudo docker run -itd \
                --net=hadoop \
                -p 16010:16010 \
                -v `pwd`/etc/hosts:/etc/hosts \
                --name hbase-master \
                -e master=1 \
                --hostname hbase-master \
                ejunjsh/hbase:1.0 &> /dev/null


# get into hbase master container
sleep 3
cp ./etc/hosts.template ./etc/hosts
echo `sudo docker inspect --format='{{.NetworkSettings.Networks.hadoop.IPAddress}}' hbase-master` hbase-master >> ./etc/hosts 

sudo docker exec -it hbase-master bash
