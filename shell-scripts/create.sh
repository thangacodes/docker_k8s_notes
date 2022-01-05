#!/bin/bash
echo " ********** Script is to deploy NS and POD using KUBECTL apply Command **********"
read -p " Please enter the Manifest file path here:" MANIFESTPATH
echo -e " Please make sure that you've entered correct path or not: $MANIFESTPATH "
kubectl apply -f $MANIFESTPATH
sleep 3
echo -e " ***** Checking what are all the pods are existing ******* "
sleep 2
kubectl get pods -A
sleep 5
kubectl get ns
sleep 4
exit
