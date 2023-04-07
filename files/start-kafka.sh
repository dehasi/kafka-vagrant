# sync files


kafka-server-start.sh -daemon /opt/kafka/config/kraft/server.properties
# update node id
# start

# Create service for Kafka
#sudo vi /etc/init.d/kafka
#sudo chmod +x  /etc/init.d/kafka
#sudo chown root:root  /etc/init.d/kafka
#sudo update-rc.d kafka defaults
# sudo service kafka start

# kafka-topics.sh --create --topic kraft-test --partitions 3 --replication-factor 3 --bootstrap-server kafka1:9092
# kafka-topics.sh --create --topic kraft-test --partitions 1 --replication-factor 1 --bootstrap-server kafka1:9092
# kafka-topics.sh --bootstrap-server kafka1:9092 --list