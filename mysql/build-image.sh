#!/bin/bash

echo ""

echo -e "\nbuild docker mysql image\n"
sudo docker build -t jackshao/mysql:1.0 .

echo ""
