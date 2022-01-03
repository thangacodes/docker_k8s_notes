#!/bin/bash
whoami
pwd
sleep 1
yum update -y
sleep 10
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl
ls -lrth
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
kubectl version
sleep 5
# Install Docker
echo "Installing Docker on Amazon Linux Machines"
yum install -y docker
systemctl start docker
systemctl enable docker
sleep 5
# Install minikube
echo "installing minikube on centOS"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
pwd
ls -lrt
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start --vm-driver=none
sleep 5
yum install conntrack -y
sleep 10
minikube status

# kubectl commands checking
echo "checking the kubectl commands"
kubectl get nodes
kubectl get nodes -o wide
kubectl get svc
kubectl get ns
kubectl get pods
kubectl get pods -n kube-system
kubectl api-resources
kubectl explain ns
kubectl explain pods
