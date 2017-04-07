#!/bin/bash

term_handler() {
	echo "term_handler"
	exit 143;
}

trap 'term_handler' SIGTERM

echo "Hello World"

while true
do
	sleep 9999 & wait ${!}
done
