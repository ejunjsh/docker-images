#!/bin/bash
n=$(cat nodes)
echo $(( $n + 1 )) > nodes

n=$(cat nodes)

i=$(( $n - 1 ))
echo "start hbase-slave$i container..."
	sudo docker run -itd \
	                --net=hadoop \
                        -v `pwd`/etc/hosts:/etc/hosts  \
	                --name hbase-slave$i \
	                --hostname hbase-slave$i \
	                ejunjsh/hbase:1.0 &> /dev/null