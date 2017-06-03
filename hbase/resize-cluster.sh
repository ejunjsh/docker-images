#!/bin/bash

# N is the node number of hadoop cluster
N=$(cat nodes)


# change slaves file
i=1
rm config/slaves
while [ $i -lt $N ]
do
	echo "hadoop-slave$i" >> config/slaves
        i=`expr $i + 1`
done 

sh build-image.sh


