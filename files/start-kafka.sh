# sync files
set -xue
sudo su vagrant && cd ~

echo $(pwd)

PATH="$PATH:/opt/kafka/bin"
echo 'PATH="$PATH:/opt/kafka/bin"' >> ~/.bashrc

KAFKA_CLUSTER_ID="$(/opt/kafka/bin/kafka-storage.sh random-uuid)"

echo KAFKA_CLUSTER_ID=$KAFKA_CLUSTER_ID  >> ~/.bashrc

kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c /opt/kafka/config/kraft/server.properties

kafka-server-start.sh -daemon /opt/kafka/config/kraft/server.properties
# update node id
# start

# Create service for Kafka
#sudo vi /etc/init.d/kafka
#sudo chmod +x  /etc/init.d/kafka
#sudo chown root:root  /etc/init.d/kafka
#sudo update-rc.d kafka defaults
# sudo service kafka start

# kafka-topics.sh --create --topic kraft-test --partitions 3 --replication-factor 3 --bootstrap-server kafka2:9092
# kafka-topics.sh --bootstrap-server kafka2:9092 --list