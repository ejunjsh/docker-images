#!/bin/bash
echo $1 > nodes
N=$(( $1 + 1 ))
i=1
cp ./config/zoo.cfg.template ./config/zoo.cfg
while [ $i -lt $N ]
do
   echo "server.$i=zk$i:2888:3888" >> ./config/zoo.cfg
   i=$(($i+1));
done

