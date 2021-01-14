#! /bin/bash

sudo docker system prune -a -f
cd frontend
sudo docker build -f test/Dockerfile -t test .
sudo docker run --name test test 
sudo docker system prune -a -f