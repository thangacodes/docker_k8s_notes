#!/bin/bash
whoami
pwd
sleep 1
# Updating yum repository
echo -e "\033[0;32m ***** Updating yum repostory ******"
yum update -y
sleep 10
# downloading kubectl from aws s3 bucket to local
echo -e "\033[0;32m ***** Downloading kubectl package from AWS S3 bucket ******"
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl
ls -lrth
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
kubectl version
sleep 5
# Install Docker
echo -e "\033[0;32m ******* Installing Docker on Amazon Linux Machines ******"
yum install -y docker
systemctl start docker
systemctl enable docker
sleep 5
# Install minikube
echo -e "\033[0;32m ******** Downloading and installing minikube on Amazon Linux machine ********"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
pwd
ls -lrt
install minikube-linux-amd64 /usr/local/bin/minikube
echo -e "\033[0;32m ********* Minikube version checking *******"
minikube version
sleep 5
echo -e "\033[0;32m ******* Installing conntrack on amazon linux box ********"
yum install conntrack -y
sleep 5
echo -e "\033[0;32m ****** Going to start minikube on amazon linux machine ********"
minikube start --vm-driver=none
sleep 5
minikube status
sleep 5
echo -e "\033[1;31m" ******** BREAK *********"
echo -e "\033[1;31m" ******** BREAK *********"
echo -e "\033[1;31m" ******** BREAK *********"
echo -e "\033[0:32m ********* Just checking kubectl commands are working or not *********"
kubectl get nodes -o wide
sleep 3
kubectl get svc 
sleep 3
kubectl get ns
sleep 3
kubectl cluster-info
sleep 3
exit

