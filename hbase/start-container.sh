#!/bin/bash

# the default node number is 3
n=$(cat nodes)
N=${n:-3}


# start hbase master container
sudo docker rm -f hbase-master &> /dev/null
sleep 1
echo "start hbase-master container..."
sudo docker run -itd \
                --net=hadoop \
                -p 16010:16010 \
                -v `pwd`/etc/hosts:/etc/hosts \
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
	sudo docker run -itd \
	                --net=hadoop \
                        -v `pwd`/etc/hosts:/etc/hosts  \
	                --name hbase-slave$i \
	                --hostname hbase-slave$i \
	                ejunjsh/hbase:1.0 &> /dev/null
	i=$(( $i + 1 ))
done 

# get into hbase master container
sleep 3
cp ./etc/hosts.template ./etc/hosts
echo `sudo docker inspect --format='{{.NetworkSettings.Networks.hadoop.IPAddress}}' hbase-master` hbase-master >> ./etc/hosts 
i=1
while [ $i -lt $N ]
do
   echo `sudo docker inspect --format='{{.NetworkSettings.Networks.hadoop.IPAddress}}' hbase-slave$i` hbase-slave$i >> ./etc/hosts
   i=$(( $i + 1 ))
done
