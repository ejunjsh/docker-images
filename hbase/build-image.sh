#!/bin/bash

echo ""

echo -e "\nbuild docker hbase image\n"
sudo docker build -t ejunjsh/hbase:1.0 .

echo ""
