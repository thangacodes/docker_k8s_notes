
# cat ns-pod.sh
#!/bin/bash
echo " ************ Automation on K8's Pods and Namespace Creation *************"
sleep 2
read -p "Enter the Namespace, you'd like to create in K8's:" NS
echo -e " you entered name is : $NS"
sleep 2
kubectl create ns $NS
sleep 2
kubectl get ns
sleep 2
read -p "Enter the Pod Path:" PODPATH
echo -e "you entered path is : $PODPATH"
sleep 2
kubectl apply -f $PODPATH
sleep 3
kubectl get pods -n $NS
sleep 3
kubectl describe pods $NS-pod -n $NS
sleep 3
exit
[root@ip-172-31-40-89 yaml]#
