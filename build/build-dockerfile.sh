#!/bin/bash

# This is script for build and run locally on the server or your local host.

# Variables

IMAGE="ssh-server-container-dockerfile"
# You can update the container starting port and ending port

# Functions

function image_build() {

    sudo docker build . -t $IMAGE

}

# Call functions

echo "Building the Dockerfile..."

image_build


