#!/bin/bash
echo " *********** Going to create pod vs namespace in kubernetes ************"
sleep 3
read -p "Enter the namespace, that you wanted to create:" NS
echo -e "Make sure and confirm that you wanted to create namespace as:$NS"
kubectl create ns $NS
sleep 2
kubectl get ns 
sleep 3
read -p "Please enter the YAML file path to create pod in K8's :" YAMLPATH
echo -e "You've entered the yaml path is as: $YAMLPATH"
sleep 3
kubectl apply -f $YAMLPATH
sleep 2
kubectl get pods -n $NS
sleep 2
kubectl describe pods $NS -n $NS
sleep 3
exit
