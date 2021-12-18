#!/bin/bash

sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo docker version

# To avoid permission issue for 'ec2-user' what we are going to do is, just adding it to the docker/wheel groups in Linux OS
sudo chmod 666 /var/run/docker.sock
sudo usermod -aG docker ec2-user
sudo usermod -aG wheel ec2-user
docker version

# To install Docker Swarm, you need to decide which EC2 instance will be electing as Master node.
# Once you decided, login to the node that you wanted to be keep as Master node
 
docker swarm init

exit 
