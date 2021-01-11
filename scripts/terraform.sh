#! /bin/bash

az aks get-credentials --resource-group lastproject --name cluster
cd terraform
terraform init
terraform plan
terraform apply -auto-approve
cd ..