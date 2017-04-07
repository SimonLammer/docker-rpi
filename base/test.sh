#!/bin/bash
set -x
docker build -t simonlammer/rpi-base .
docker rm -f test
docker run --name test -v $(pwd)/handlers:/handlers -d simonlammer/rpi-base
docker stop test
sleep 1
docker start test
docker kill test
echo "=============================="
docker logs -t test
log=$(docker logs test)
expected=$(echo -e "Hello World\nterm_handler\nHello World")
if [[ $log == $expected ]] ; then
	echo "Tests succeeded"
	exit 0;
else
	echo "Tests failed"
	exit 1;
fi
