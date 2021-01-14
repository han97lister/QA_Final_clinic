#! /bin/bash

cd frontend
sudo docker build -f test/Dockerfile -t test .
sudo docker run --name test test 