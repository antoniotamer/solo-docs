#!/bin/bash

cd deployer
CGO_ENABLED=0 GOOS=linux go build
cd ..
export TAG=`git log -n 1 --pretty=format:%h`
docker build -t soloio/gloo-docs:latest -t soloio/gloo-docs:$TAG .
docker push soloio/gloo-docs:latest
docker push soloio/gloo-docs:$TAG
