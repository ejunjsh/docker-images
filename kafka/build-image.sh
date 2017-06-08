#!/bin/bash

echo ""

echo -e "\nbuild docker kafka  image\n"
sudo docker build -t ejunjsh/kafka:1.0 .

echo ""
