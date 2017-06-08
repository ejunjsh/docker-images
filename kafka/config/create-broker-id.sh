#!/bin/bash
cp /usr/local/kafka/config/server.properties.template /usr/local/kafka/config/server.properties
echo "broker.id=$brokerid"  >> /usr/local/kafka/config/server.properties
