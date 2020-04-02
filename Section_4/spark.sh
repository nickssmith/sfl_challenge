#!/usr/bin/env bash

#TODO fix networking (spark shell at localhost from inside ontianer doesnt work ??
#https://spark.apache.org/docs/latest/submitting-applications.html


wget http://www.trieuvan.com/apache/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz
tar -xzf spark-2.4.5-bin-hadoop2.7.tgz

MASTER=spark://10.5.0.2:7077 ./spark-2.4.5-bin-hadoop2.7/bin/spark-shell --master spark://10.5.0.2:7707
