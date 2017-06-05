#!/bin/bash

# start hbase slave container
	sudo docker rm -f hbase-slave$1 &> /dev/null
        sleep 1
	echo "start hbase-slave$1 container..."
	sudo docker run -itd \
	                --net=hadoop \
                        -v `pwd`/etc/hosts:/etc/hosts  \
	                --name hbase-slave$1 \
                        -e slave=1 \
	                --hostname hbase-slave$1 \
	                ejunjsh/hbase:1.0 &> /dev/null

# get into hbase master container
sleep 3
   echo `sudo docker inspect --format='{{.NetworkSettings.Networks.hadoop.IPAddress}}' hbase-slave$1` hbase-slave$1 >> ./etc/hosts

sudo docker exec -it hbase-slave$1 bash
