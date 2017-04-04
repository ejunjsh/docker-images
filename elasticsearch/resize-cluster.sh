#!/bin/bash
echo $1 > nodes
N=$(( $1 + 1 ))
i=1
cp ./config/elasticsearch.yml.template ./config/elasticsearch.yml
while [ $i -lt $N ]
do
   echo "   - ec$i" >> ./config/elasticsearch.yml
   i=$(($i+1));
done

