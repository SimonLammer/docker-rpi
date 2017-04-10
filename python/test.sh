#!/bin/bash
set -x
docker rm -f test
image=$(pwd | sed -E 's/.*\/(.*)$/\1/')
cd ..
make run I=$image
