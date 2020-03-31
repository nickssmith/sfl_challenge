#!/usr/bin/env bash

set -e

TOPIC_TO_MAKE="ntest"
rm -rf kafka_2.12-2.4.1

#wget https://mirrors.gigenet.com/apache/kafka/2.4.1/kafka_2.12-2.4.1.tgz
tar -xzf kafka_2.12-2.4.1.tgz

cd kafka_2.12-2.4.1

# start servers and fork
gnome-terminal -- bin/zookeeper-server-start.sh config/zookeeper.properties &
gnome-terminal -- bin/kafka-server-start.sh config/server.properties &

read  -n 1 -p "Push enter to close" inpt
