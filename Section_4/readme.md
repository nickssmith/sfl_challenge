# Kafka: TLDR

##PART 1
Concepts:
 - Kafka is run as a cluster on one or more servers;
   - All data stored on the cluster is split among partitions across the cluster
   - Each partition holds log files that are sequential write only
   - Improves resiliency and performance by splitting locations to write/read from to multiple
 - The Kafka cluster stores streams of records in categories called topics; 
   - Its a tag for logs to be written too
   - Set a message to a topic and it will be findable via that topic later
     - ex: All webserver logs are under the "Webserver" topic and all database logs under the "Database" topic
 - Each record consists of a key, a value, and a timestamp
   - Given a key,value and the producer will make a timestamp
   - Its a log dealio, not too much to explain here

##PART 2
Describe the four Kafka core APIs: 
 - Producer API;
   - Send to kafka
   - Just import the library and write to it
 - Consumer API; 
   - Listen to a stream
   - Polls for data
   - Import the library and make a listener
 - Streams API; 
   - Read from input topic, filter or do whatever, then makes another topic
   - Basically a consumer+producer used to manipulate data
 - Connector API.
   - Move existing data in and out of kafka


##PART 3
Order to run

1. Run the "start_servers.sh" in 1 terminal window, it will open 2 new windows (for easier debug of logs)
1. Run the "run_kafka_cmds.sh" in another window, it will open another window for the consumer then make a prompt to enter messages

##PART 4

Google for a docker instance of spark, found one [here](https://hub.docker.com/r/bitnami/spark/)

