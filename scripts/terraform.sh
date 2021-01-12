#! /bin/bash

cd terraform
terraform init
terraform plan
terraform apply -auto-approve
cd ..
az aks get-credentials --resource-group lastproject --name cluster