#! /bin/bash

az aks get-credentials --resource-group lastproject --name cluster
cd terraform
terraform init
terraform apply