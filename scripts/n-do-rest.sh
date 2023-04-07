# sync files

mv /tmp/server.properties /opt/kafka/config/kraft/server.properties
chmod 666 /opt/kafka/config/kraft/server.properties

mv /tmp/kafka /etc/init.d/kafka
chmod 777 /etc/init.d/kafka


mv /tmp/start-kafka.sh /home/vagrant/start-kafka.sh
chmod 777 /home/vagrant/start-kafka.sh

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