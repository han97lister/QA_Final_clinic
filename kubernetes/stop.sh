#!/bin/bash

kubectl delete -f mysql.yaml
kubectl delete -f backend.yaml
kubectl delete -f frontend.yaml
kubectl delete -f nginx.yaml