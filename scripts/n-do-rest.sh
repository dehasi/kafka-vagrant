exit 0;
export KAFKA_CLUSTER_ID="$(/opt/kafka/bin/kafka-storage.sh random-uuid)"
/opt/kafka/bin/kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c config/kraft/server.properties

/opt/kafka/bin/kafka-server-start.sh -daemon config/kraft/server.properties
# update node id
# start

# Create service for Kafka
#sudo vi /etc/init.d/kafka
#sudo chmod +x  /etc/init.d/kafka
#sudo chown root:root  /etc/init.d/kafka
#sudo update-rc.d kafka defaults
# sudo service kafka start

* change ownership to root: `chown root:root /etc/init.d/kafka`
* install service: `sudo update-rc.d kafka defaults`
* start kafka: `sudo servivce kafka start`