#!/bin/bash

echo ""

echo -e "\nbuild docker redis image\n"
sudo docker build -t jackshao/redis:1.0 .

echo ""
