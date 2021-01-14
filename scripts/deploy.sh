#! /bin/bash

cd kubernetes
#./stop.sh
./start.sh
cd ..
kubectl rollout restart deployment mysql.yaml back.yaml front.yaml nginx.yaml