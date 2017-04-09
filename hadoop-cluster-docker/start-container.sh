#!/bin/bash

# the default node number is 3
n=$(cat nodes)
N=${n:-3}


# start hadoop master container
sudo docker rm -f hadoop-master &> /dev/null
sleep 1
echo "start hadoop-master container..."
sudo docker run -itd \
                --net=hadoop \
                -p 50070:50070 \
                -p 8088:8088 \
                --name hadoop-master \
                --hostname hadoop-master \
                ejunjsh/hadoop:1.0 &> /dev/null


# start hadoop slave container
i=1
while [ $i -lt $N ]
do
	sudo docker rm -f hadoop-slave$i &> /dev/null
        sleep 1
	echo "start hadoop-slave$i container..."
	sudo docker run -itd \
	                --net=hadoop \
	                --name hadoop-slave$i \
	                --hostname hadoop-slave$i \
	                ejunjsh/hadoop:1.0 &> /dev/null
	i=$(( $i + 1 ))
done 

# get into hadoop master container
sleep 1
sudo docker exec -it hadoop-master start-dfs.sh
sudo docker exec -it hadoop-master start-yarn.sh 
sudo docker exec -it hadoop-master bash
