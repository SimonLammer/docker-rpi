#!/bin/bash
set -x
docker build -t simonlammer/rpi-base .
docker rm -f test
docker run --name test -d simonlammer/rpi-base
docker stop test
sleep 1
docker start test
docker kill test
echo "=============================="
docker logs -t test
