#!/bin/bash
echo " ************ Automate on K8's Pods and Namespace Creation *************"
sleep 2
read -p "Enter the Namespace, you'd like to create in K8's:" NS
echo -e " you entered name is : $NS"
sleep 2
kubectl create ns $NS
echo "Going to see namespace is created or not:"
kubectl get ns
sleep 2
read -p "Enter the YAML file Path:" YAMLPATH
echo -e "you entered name is : $YAMLPATH"
sleep 2
kubectl apply -f $PODPATH
sleep 3
kubectl get pods -n $NS
sleep 3
kubectl describe pods $NS-pod -n $NS
sleep 3
exit
