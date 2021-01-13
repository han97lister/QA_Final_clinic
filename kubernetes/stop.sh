#! /bin/bash

kubectl delete -f mysql.yaml --validate=false
kubectl delete -f back.yaml
kubectl delete -f front.yaml
kubectl delete -f nginx.yaml