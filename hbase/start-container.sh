#!/bin/bash

# the default node number is 3
n=$(cat nodes)
N=${n:-3}


# start hbase master container
sudo docker rm -f hbase-master &> /dev/null
sleep 1
echo "start hbase-master container..."
sudo docker run -d \
                --net=hadoop \
                --name hbase-master \
                --hostname hbase-master \
                ejunjsh/hbase:1.0 &> /dev/null


# start hbase slave container
i=1
while [ $i -lt $N ]
do
	sudo docker rm -f hbase-slave$i &> /dev/null
        sleep 1
	echo "start hbase-slave$i container..."
	sudo docker run -d \
	                --net=hadoop \
	                --name hbase-slave$i \
	                --hostname hbase-slave$i \
	                ejunjsh/hbase:1.0 &> /dev/null
	i=$(( $i + 1 ))
done 

# get into hadoop master container
sleep 1
sudo docker exec -it hbase-master start-hbase.sh
sudo docker exec -it hbase-master bash
