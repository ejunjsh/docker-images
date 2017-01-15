#!/bin/bash

echo ""

echo -e "\nbuild docker zookeeper image\n"
sudo docker build -t jackshao/zookeeper:1.0 .

echo ""
