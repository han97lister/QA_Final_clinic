#! /bin/bash

az aks get-credentials --resource-group finalproject --name cluster
cd terraform
terraform init
terraform plan
terraform apply -auto-approve
cd ..
