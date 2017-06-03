#!/bin/bash

# N is the node number of hbase cluster
N=$(cat nodes)


# change regionservers file
i=1
rm config/regionservers
while [ $i -lt $N ]
do
	echo "hbase-slave$i" >> config/regionservers
        i=`expr $i + 1`
done 

sh build-image.sh


