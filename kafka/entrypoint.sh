#!/bin/bash

sed -i -e "s/broker.id=0/broker.id=-1/g" config/server.properties
sed -i -e "s/zookeeper.connect=localhost:2181/zookeeper.connect=zookeeper:2181/g" config/server.properties
sed -i -e "s/#delete.topic.enable=true/delete.topic.enable=true/g" config/server.properties

echo "host.name=kafka" >> config/server.properties
sed -i -e "s/#listeners=PLAINTEXT:\\/\\/:9092/listeners=PLAINTEXT:\\/\\/0.0.0.0:9092/g" config/server.properties

sed -i -e "s/#advertised.listeners=PLAINTEXT:\\/\\/your.host.name:9092/advertised.listeners=PLAINTEXT:\\/\\/kafka:9092/g" config/server.properties
echo "advertised.host.name=kafka" >> config/server.properties
echo "advertised.port=9092" >> config/server.properties

./bin/kafka-server-start.sh config/server.properties