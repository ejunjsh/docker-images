#!/bin/bash
# start redis container
N=$1
N=$(( $N + 1 ))
i=1
redis-trib.rb create --replicas 1 \
"$(while [ $i -lt $N ] \
do                     \
       host redis$i | cut -d ' ' -f 4`:6379 \
        i=$(( $i + 1 )) \
done)"
