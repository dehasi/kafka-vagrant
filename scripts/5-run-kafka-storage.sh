set -xue

PATH="$PATH:/opt/kafka/bin"
sudo echo 'export PATH="$PATH:/opt/kafka/bin"' >> /etc/profile
sudo echo 'export PATH="$PATH:/opt/kafka/bin"' >> /home/vagrant/.bashrc

# KAFKA_CLUSTER_ID="$(/opt/kafka/bin/kafka-storage.sh random-uuid)"
KAFKA_CLUSTER_ID='1IhHW8KOTOeZKvDOdUqB8Q'
sudo echo "export KAFKA_CLUSTER_ID=${KAFKA_CLUSTER_ID}" >> /etc/profile

kafka-storage.sh format -t ${KAFKA_CLUSTER_ID} -c /opt/kafka/config/kraft/server.properties
