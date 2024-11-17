#!/bin/bash

echo "Script executed at: $(date +'%Y-%m-%d::%H-%M-%S')"

# Check if the Docker image pyweb already exists
IMAGE_EXISTS=$(docker images -q pyweb)

if [ -z "$IMAGE_EXISTS" ]; then
    # If the image does not exist, build it
    echo "Image pyweb not found. Building the image..."
    docker build -t pyweb .
else
    # If the image exists, rebuild the web service using docker-compose
    echo "Image pyweb exists. Rebuilding the web service..."
    docker-compose build web
fi

# Bring up the containers using docker-compose
echo "Starting the containers with docker-compose up..."
docker-compose up

# Exit the script after running docker-compose up
exit 0
