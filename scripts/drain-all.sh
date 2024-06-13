#!/bin/bash

# Functions

function status(){

exit_status=$?

if [ $exit_status -ne 0 ]; then
    echo "Some errors, need to check..."
    exit 1
fi

echo "Finished to clean containers ssh server..."
echo "Finished time of drain is: "; date
exit $exit_status

}

function clean_containers() {

    docker rm -f $(docker ps -a | grep "/usr/sbin/sshd" | awk '{print $1}')

}

echo "Starting cleaning of containers ssh server..."
echo "Starting time of drain is: "; date

# Call functions

clean_containers && status

