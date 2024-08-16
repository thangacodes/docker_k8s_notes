#!/bin/bash
# Print the execution time
echo "Execution time: $(date '+%Y-%m-%d %H:%M:%S')"

# Provide information about the script functionality
echo "Build, run, stop, cleanup container and image with this script"

# Define the location of the Dockerfile
DFILE="/Users/td/Downloads/dock/python"
echo "The Dockerfile is located at: ${DFILE}"

# Prompt for the image name
read -p "Please enter the Image name: " IMAGE
echo "You've entered IMAGE name as: ${IMAGE}"

# Build the Docker image
echo "Image preparation begins shortly..."
docker build -t ${IMAGE} ${DFILE}
if [ $? -ne 0 ]; then
    echo "Error: Docker build failed."
    exit 1
fi
# List Docker images
docker images
# Prompt for the container name
read -p "Enter the name that you want to setup for the container: " DCONT

# Run the Docker container
docker run -dit --name ${DCONT} -p 80:5000 ${IMAGE}
if [ $? -ne 0 ]; then
    echo "Error: Docker run failed."
    exit 1
fi
# List Docker containers
docker ps -a
# Stop and remove the Docker container
echo "Stopping a running container: ${DCONT}"
docker stop ${DCONT}
if [ $? -ne 0 ]; then
    echo "Error: Docker stop failed."
    exit 1
fi
echo "Removing stopped container: ${DCONT}"
docker rm ${DCONT}
if [ $? -ne 0 ]; then
    echo "Error: Docker remove failed."
    exit 1
fi
# Remove stopped containers
echo "Pruning stopped containers..."
docker container prune -f

# Check if any Docker containers exist
echo "Cross-checking if any Docker containers exist or not..."
docker ps -a

# Remove the Docker image
echo "Removing the Docker image that was built recently: ${IMAGE}"
docker rmi -f ${IMAGE}
if [ $? -ne 0 ]; 
then
    echo "Error: Docker rmi failed."
    exit 1
fi
docker images
docker ps -a
# Exit the script
exit 0
