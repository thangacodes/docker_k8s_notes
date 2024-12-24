#!/bin/bash
# Print the script execution time
echo "The script was executed at: $(date '+%d-%m-%Y %H:%M:%S')"

# Step 1: Build the Docker image
read -p "Enter the image name that you wanted to create from this file: " IMAGE_NAME
echo "User entered image name is: ${IMAGE_NAME}"
echo "Building the Docker image..."

# Build the Docker image
docker build -t "${IMAGE_NAME}:v1" .

# Step 2: Run the Docker container
echo "Running the Docker container..."
docker run -d -p 5000:5000 --name web1 "${IMAGE_NAME}:v1"

# Step 3: Open the application in the browser
echo "Opening the application in your default browser..."

# Check for the operating system and open the browser
if [[ "$OSTYPE" == "darwin"* ]]; then
    open -a "Google Chrome" http://localhost:5000/
elif [[ "$OSTYPE" == "cygwin" ]]; then
    start chrome http://localhost:5000/
else
    echo "Unknown OS: Unable to open browser automatically."
    echo "Please open http://localhost:5000/ in your browser manually."
fi

# Wait for 10 seconds to allow the application to load
sleep 10
# Ask if the user wants to stop the container
read -p "Do you want to stop the docker container which was provisioned with the help of this script? (yes/no): " USER_ANS
echo "User has entered: $USER_ANS"

# Check the user's response
if [[ "$USER_ANS" == "yes" || "$USER_ANS" == "YES" ]]; then
    echo "Going to stop the container..."
    # Ask for the container ID
    echo "List out the available running containers.."
    docker ps -a
    read -p "Enter the container ID (or name) to stop: " CID
    echo "User has entered the container ID: $CID"
    # Stop and remove the container
    echo "Stopping the container with ID: $CID"
    docker stop "${CID}"
    echo "Removing the container with ID: $CID"
    docker rm -f "${CID}"
    docker images
    echo "Deleting the image with it's ID.."
    read -p "Enter the Image ID (or name) to delete:" DOCKER_IMAGE_ID
    docker rmi -f "${DOCKER_IMAGE_ID}" || { echo "Failed to remove image! Exiting."; exit 1; }
    sleep 2
    echo "Cross checking whether the images has deleted or not.."
    docker images | grep "${DOCKER_IMAGE_ID}" > /dev/null && { echo "Image deletion failed!"; exit 1; } || echo "Image deleted successfully."
elif [[ "$USER_ANS" == "no" || "$USER_ANS" == "NO" ]]; then
    echo "User chose not to stop the container. Exiting."
else
    echo "Invalid input. Please enter 'yes' or 'no'. Please retry the script."
    exit 1
fi
exit 0
