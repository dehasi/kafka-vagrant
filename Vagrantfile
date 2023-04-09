# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant multi-machine sample setup

GB = 1024
Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"

  config.vm.provision "setup /etc/hosts", :type => "shell", :path => "scripts/0-setup-etc-hosts.sh"
  config.vm.provision "install jdk", :type => "shell", :path => "scripts/1-install-jdk.sh"
  config.vm.provision "download kafka", :type => "shell", :path => "scripts/2-download-kafka.sh"
  config.vm.provision "turn off swap", :type => "shell", :path => "scripts/3-turn-swap-off.sh"
  config.vm.provision "file", source: "files/kraft-server.properties", destination: "/tmp/server.properties"
  config.vm.provision "file", source: "files/kafka-init.d.sh", destination: "/tmp/kafka"
  config.vm.provision "sync files", :type => "shell", :path => "scripts/4-sync-files.sh"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2*GB
    vb.cpus = 2
  end

  config.vm.define "kafka1" do |kafka|
     kafka.vm.network :private_network, ip: "10.0.0.1"
     kafka.vm.hostname = "kafka1"
     kafka.vm.provision "delete KAFKA from localhost", type: "shell", inline: " sed -i 's/127.*kafka.*/#&/' /etc/hosts"
     kafka.vm.provision "set NODE_ID", type: "shell", inline: "sed -i 's/NODE_ID/1/g' /opt/kafka/config/kraft/server.properties"
     kafka.vm.provision "set KAFKA_HOST", type: "shell", inline: "sed -i 's/KAFKA_HOST/kafka1/g' /opt/kafka/config/kraft/server.properties"
     kafka.vm.provision "set KAFKA_CLUSTER_ID", type: "shell", path: "scripts/5-run-kafka-storage.sh"
     kafka.vm.provision "register kafka service", type: "shell", inline: "sudo update-rc.d kafka defaults"
     kafka.vm.provision "start kafka service", type: "shell", inline: "sudo service kafka start"
  end

  config.vm.define "kafka2" do |kafka|
     kafka.vm.network :private_network, ip: "10.0.0.2"
     kafka.vm.hostname = "kafka2"
     kafka.vm.provision "delete KAFKA from localhost", type: "shell", inline: " sed -i 's/127.*kafka.*/#&/' /etc/hosts"
     kafka.vm.provision "set NODE_ID", type: "shell", inline: "sed -i 's/NODE_ID/2/g' /opt/kafka/config/kraft/server.properties"
     kafka.vm.provision "set KAFKA_HOST", type: "shell", inline: "sed -i 's/KAFKA_HOST/kafka2/g' /opt/kafka/config/kraft/server.properties"
     kafka.vm.provision "set KAFKA_CLUSTER_ID", type: "shell", path: "scripts/5-run-kafka-storage.sh"
     kafka.vm.provision "register kafka service", type: "shell", inline: "sudo update-rc.d kafka defaults"
     kafka.vm.provision "start kafka service", type: "shell", inline: "sudo service kafka start"
  end

  config.vm.define "kafka3" do |kafka|
     kafka.vm.network :private_network, ip: "10.0.0.3"
     kafka.vm.hostname = "kafka3"
     kafka.vm.provision "delete KAFKA from localhost", type: "shell", inline: " sed -i 's/127.*kafka.*/#&/' /etc/hosts"
     kafka.vm.provision "set NODE_ID", type: "shell", inline: "sed -i 's/NODE_ID/3/g' /opt/kafka/config/kraft/server.properties"
     kafka.vm.provision "set KAFKA_HOST", type: "shell", inline: "sed -i 's/KAFKA_HOST/kafka3/g' /opt/kafka/config/kraft/server.properties"
     kafka.vm.provision "set KAFKA_CLUSTER_ID", type: "shell", path: "scripts/5-run-kafka-storage.sh"
     kafka.vm.provision "register kafka service", type: "shell", inline: "sudo update-rc.d kafka defaults"
     kafka.vm.provision "start kafka service", type: "shell", inline: "sudo service kafka start"
  end
end