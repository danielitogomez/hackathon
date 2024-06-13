#!/bin/bash

# Variables

SERVER="localhost"
IMAGE="ssh-server-container-dockerfile"
# You can update the container starting port and ending port
PORT_START="2222"
PORT_END="2262"
HOST_PORT="22"
PORTS="/tmp/ports-available.txt"

rm -rf $PORTS

if [ ! -f $PORTS ]
then
    touch $PORTS
fi

# Functions

function list_available_port() {

    for i in $(seq $PORT_START $PORT_END); do

    CLOSED=$(nmap -p $i $SERVER | grep "$i" | grep open)

        if [ -z "$CLOSED" ]; then
          echo "Ports closed - available"
          echo "$i" >> $PORTS
          echo "$i"

        else
          echo "Ports open - no available"
          echo "$i"
        fi

done

}

function run_container() {

  elements=$PORTS

   for port in $(cat $elements | head -n1); do

        echo "Container creating in port $port available"

        docker run -d -p $port:$HOST_PORT $IMAGE

          if [[ $? != 0 ]]; then
                echo "Error binding the port: $port"
                break
          fi

    done

}

# Call functions

list_available_port

run_container