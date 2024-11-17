#!/bin/bash

# Print the current date and time
echo "Script executed at: " $(date +'%Y-%m-%d:: %M-%S-%H')

# Bring down the Docker Compose services
docker-compose down

# List all Docker containers, including stopped ones
containers=$(docker ps -a -q)

# Check if there are any containers and remove them
if [ -n "$containers" ]; then
    echo "Removing Docker containers..."
    docker rm $containers
else
    echo "No Docker containers to remove."
fi

# List all Docker images
images=$(docker images --format "{{.Repository}}:{{.Tag}}")

# Check for specific images and remove them
for image in $images; do
    if [[ "$image" == "pyweb:latest" || "$image" == "postgres:latest" ]]; then
        echo "Removing image: $image"
        docker rmi $image
    fi
done
exit 0
