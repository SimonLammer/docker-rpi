#!/bin/bash

execute_if_file_exists() {
	if [ -f $1 ]; then
		$1
	fi
}

start() {
	execute_if_file_exists /handlers/start.sh
}

stop() {
	execute_if_file_exists /handlers/stop.sh
	exit 143
}

usr1() {
	execute_if_file_exists /handlers/usr1.sh
}

usr2() {
	execute_if_file_exists /handlers/usr2.sh
}

trap 'stop' SIGTERM
trap 'usr1' SIGUSR1
trap 'usr2' SIGUSR2

start

while true
do
	sleep 9999 & wait ${!}
done
