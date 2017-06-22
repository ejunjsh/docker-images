#!/bin/bash
cp /usr/local/ec/config/elasticsearch.yml.template /usr/local/ec/config/elasticsearch.yml
if [ -n "$master"  ]
then
  echo "node.master : true">> /usr/local/ec/config/elasticsearch.yml
  echo "node.data : false">> /usr/local/ec/config/elasticsearch.yml  
fi
if [ -n "$slave"  ]
then
  echo "node.master : false">> /usr/local/ec/config/elasticsearch.yml
  echo "node.data : true">> /usr/local/ec/config/elasticsearch.yml
fi

