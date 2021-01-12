#! /bin/bash


cd terraform
terraform init
terraform plan
terraform apply -auto-approve
cd ..
az aks get-credentials --resource-group finalproject --name cluster