# turn swap off
swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab # not sure if it needed
