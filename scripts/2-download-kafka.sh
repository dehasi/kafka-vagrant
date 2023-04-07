# download and extract kafka

KAFKA='kafka_2.13-3.4.0'
wget https://dlcdn.apache.org/kafka/3.4.0/${KAFKA}.tgz
tar -xvf ${KAFKA}.tgz
sudo mv ${KAFKA} /opt/kafka
# mv ${KAFKA} ~
PATH="$PATH:/opt/kafka/bin"
sudo chmod 777 -R /opt/kafka
rm /opt/kafka/config/kraft/server.properties
mkdir -p /opt/kafka/config/kraft/
sudo chmod +w /opt/kafka/config/kraft/

USER=vagrant
# create directories for log for kafka and zookeeper
sudo mkdir -p /data/kafka
sudo chown ${USER}:${USER} /data/kafka


##
sudo chmod +rw -R /opt/kafka/