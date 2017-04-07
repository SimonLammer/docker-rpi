#!/bin/bash

start() {
	if [ -f /handlers/start.sh ]; then
		/handlers/start.sh
	fi
}

term_handler() {
	if [ -f /handlers/stop.sh ]; then
		/handlers/stop.sh
	fi
	exit 143
}

trap 'term_handler' SIGTERM

start

while true
do
	sleep 9999 & wait ${!}
done
