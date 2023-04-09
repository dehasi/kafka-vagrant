# sync files

mv /tmp/server.properties /opt/kafka/config/kraft/server.properties
chmod 666 /opt/kafka/config/kraft/server.properties

mv /tmp/kafka /etc/init.d/kafka
chmod 777 /etc/init.d/kafka
chown root:root /etc/init.d/kafka
