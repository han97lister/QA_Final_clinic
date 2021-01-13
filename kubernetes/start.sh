#! /bin/bash

kubectl apply -f mysql.yaml --validate=false
kubectl apply -f back.yaml
kubectl apply -f front.yaml
kubectl apply -f nginx.yaml