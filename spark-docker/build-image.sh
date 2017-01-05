#!/bin/bash

echo ""

echo -e "\nbuild docker spark image\n"
sudo docker build -t jackshao/spark:1.0 .

echo ""
