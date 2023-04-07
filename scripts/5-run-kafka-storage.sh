set -xue
sudo su vagrant && cd ~

echo $(pwd)

PATH="$PATH:/opt/kafka/bin"
echo 'PATH="$PATH:/opt/kafka/bin"' >> /etc/profile

KAFKA_CLUSTER_ID="$(/opt/kafka/bin/kafka-storage.sh random-uuid)"

echo "export KAFKA_CLUSTER_ID=${KAFKA_CLUSTER_ID}" >> /etc/profile

kafka-storage.sh format -t ${KAFKA_CLUSTER_ID} -c /opt/kafka/config/kraft/server.properties
