# Script to check on kubernetes admin systems that the require packages installed or not.
# This script is mainly designed to check the package version that are required to configure and access Amazon Elastic Kubernetes Service (Amazon EKS)

## Package lists are
a) kubectl
b) Amazon Elastic Kubernetes Service (Amazon EKS)
c) eksctl

# Script starts here,

#!/bin/bash
set -x
echo "Checking kubernetes pre-requisites package on Admin machine"
sleep 1
echo -e "\033[0;32m<<READY>> <<STEADY>> <<GO>> <<BOOM>>"
echo -e "\033[0;32mKubectl version is below"
kubectl version
sleep 2
echo -e "\033[0;32meksctl version is below"
eksctl version
sleep 2
echo -e "\033[0;33miam-auht version is below"
aws-iam-authenticator version
sleep 2
exit
