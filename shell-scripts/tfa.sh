#!/bin/bash

echo "Simple Script to apply OR destory the infrastructure stack provisioned by Terraform(Iac)"
sleep 2
echo "Action,READY, STEDY, GO"
sleep 5
echo "Please enter 1 to initializing terraform to download the require plugins for the CLOUD PROVIDER"
echo "Please enter 2 to format the code that we written in HCL"
echo "Please enter 3 to validate the code that we written in HCL"
echo "Please enter 4 to apply the code to provision infra in AWS"
echo "Please enter 5 to destroy the infra that we provisioned via terraform"
sleep 2
read -p "Enter the number to perform these actions one after another:" NUMBER
if [ $NUMBER -eq 1 ]; then
        terraform init
elif [ $NUMBER -eq 2 ]; then
        terraform fmt
elif [ $NUMBER -eq 3 ]; then
        terraform validate
elif [ $NUMBER -eq 4 ]; then
        terraform apply --auto-approve
elif [ $NUMBER -eq 5 ]; then
        terraform destory --auto-approve
else
        echo "You should choose the number between 1 to 5"
fi

