#!/bin/bash
echo "Simple Script to apply OR destory the infrastructure stack provisioned by Terraform(Iac)"
sleep 2
echo "Please enter 1 to creating infra stack in aws"
echo "Please enter 2 to destroying infra stack in aws"
read -p "Enter the number to create/destroy:" NUMBER
if [ $NUMBER -eq 1 ]; then
        terraform apply --auto-approve
elif [ $NUMBER -eq 2 ]; then
        terraform destroy --auto-approve
else
        echo "You should choose the number 1 or 2"
fi
