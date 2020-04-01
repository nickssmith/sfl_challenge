#!/usr/bin/env bash

kubectl run spark --image=bitnami/spark:2
kubectl run mesos --image=mesosphere/mesos-master
kubectl run akka --image=akkadotnet/mono-base
kubectl run cassandra --image=cassandra
kubectl run kafka --image=kafkamanager/kafka-manager

