#!/bin/bash

echo ""

echo -e "\nbuild docker elasticsearch image\n"
sudo docker build -t jackshao/elasticsearch:1.0 .

echo ""
