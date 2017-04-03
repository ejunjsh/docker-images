#!/bin/bash

echo ""

echo -e "\nbuild docker jenkins image\n"
sudo docker build -t jackshao/jenkins:1.0 .

echo ""
