#! /bin/bash

kubectl apply -f mysql.yaml
kubectl apply -f back.yaml
kubectl apply -f front.yaml
kubectl apply -f nginx.yaml