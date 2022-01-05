# Script to check on kubernetes admin systems that the require packages installed or not.
# This script is mainly designed to check the package version that are required to configure and access Amazon Elastic Kubernetes Service (Amazon EKS)

## Package lists are
#kubectl
#aws-iam-authenticator
#eksctl
#awscli

# Script starts here,

#!/bin/bash

echo "******** Checking kubernetes pre-requisites package on Admin machine *********"
sleep 1
echo -e "\033[0;32m ********Require Packages in-order to contact kube Control plane *********"

echo -e "\033[0;32m Kubectl version is below"

kubectl version
sleep 2
echo -e "\033[0;32m eksctl version is below"

eksctl version
sleep 2

echo -e "\033[0;32m iam-auth version is below"
aws-iam-authenticator version
sleep 2

echo -e "\033[0:32m awscli version is below"
aws  --version

exit

