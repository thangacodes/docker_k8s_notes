#!/bin/bash

echo "Script executed at: $(date +'%Y-%m-%d::%H-%M-%S')"

#variable
image_name="pyweb"

# Check if the Docker image pyweb already exists
IMAGE_EXISTS=$(docker images -q "${image_name}")

if [ -z "$IMAGE_EXISTS" ]; then
    # If the image does not exist, build it
    echo "Image "${image_name}" not found. Building the "${image_name}" image..."
    docker build -t "${image_name}" .
else
    # If the image exists, rebuild the web service using docker-compose
    echo "Image "${image_name}" exists. Rebuilding the web service..."
    docker-compose build web
fi

# Bring up the containers using docker-compose
echo "Starting the containers with docker-compose up..."
docker-compose up

# Exit the script after running docker-compose up
exit 0
