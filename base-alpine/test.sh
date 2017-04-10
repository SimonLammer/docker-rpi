#!/bin/bash
set -x
docker rm -f test
image=$(pwd | sed -E 's/.*\/(.*)$/\1/')
cd ..
make run I=$image
docker kill --signal="SIGUSR1" test
docker kill --signal="SIGUSR2" test
docker stop test
sleep 1
docker start test
docker kill test
echo "=============================="
docker logs -t test
log=$(docker logs test)
expected=$(echo -e "start\nusr1\nusr2\nstop\nstart")
if [[ $log == $expected ]] ; then
	echo "Tests succeeded"
	exit 0;
else
	echo "Tests failed"
	exit 1;
fi
