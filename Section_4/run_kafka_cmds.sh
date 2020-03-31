#!/usr/bin/env bash

#set -e

TOPIC_TO_MAKE="ntest"

cd kafka_2.12-2.4.1


bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic $TOPIC_TO_MAKE

bin/kafka-topics.sh --list --bootstrap-server localhost:9092


gnome-terminal -- bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic $TOPIC_TO_MAKE --from-beginning

bin/kafka-console-producer.sh --broker-list localhost:9092 --topic $TOPIC_TO_MAKE

