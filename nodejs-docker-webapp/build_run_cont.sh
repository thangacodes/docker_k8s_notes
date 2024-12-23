#!/bin/bash
echo "The script was executed at: $(date '+%d-%m-%Y %H:%M:%S')"

# Step 1: Build the Docker image
read -p "Enter the image name that you wanted to create from this file: " IMAGE_NAME
echo "User entered image name is: ${IMAGE_NAME}"
echo "Building the Docker image..."

# Build the Docker image
docker build -t ${IMAGE_NAME}:v1 .

# Step 2: Run the Docker container
echo "Running the Docker container..."
docker run -d -p 5000:5000 --name web1 ${IMAGE_NAME}:v1

# Step 3: Open the application in the browser
echo "Opening the application in your default browser..."

# Check for the operating system
if [[ "$OSTYPE" == "darwin"* ]]; then
    open -a "Google Chrome" http://localhost:5000/
elif [[ "$OSTYPE" == "cygwin" ]]; then
    start chrome http://localhost:5000/
else
    echo "Unknown OS: Unable to open browser automatically."
    echo "Please open http://localhost:5000/ in your browser manually."
fi
