#!/bin/bash
# Show the current date and time of execution
echo "The script was executed at:" $(date '+%d-%m-%Y %H:%M:%S')
echo "Going to start the server locally..."
echo
# Check if node_modules directory exists
if [ ! -d "node_modules" ]; then
    echo "node_modules directory not found, installing npm modules..."
    # Run npm install and exit if it fails
    if ! npm install; then
        echo "npm install failed. Exiting script."
        exit 1
    fi
else
    # If node_modules exists, skip the install and start the server
    echo "node_modules directory exists, skipping npm install, starting node app server"
    echo "Starting the node app server..."
fi
# Check if node command exists
if ! command -v node &> /dev/null; then
    echo "Node.js is not installed. Please install Node.js and try again."
    exit 1
fi
# Start the server
node index.js &
# Sleep for a moment before prompting the user
sleep 5

# Prompt user for input
read -p "Do you want to kill the process ID bound to port 5000? (yes/no): " USER_INPUT

# Validate user input (case-insensitive)
USER_INPUT=$(echo "$USER_INPUT" | tr '[:upper:]' '[:lower:]')

if [[ "$USER_INPUT" == "yes" ]]; then
    echo "Going to kill the process bound to port 5000."

    # Check if lsof is available
    if ! command -v lsof &> /dev/null; then
        echo "lsof command is not installed. Cannot check for processes on port 5000."
        exit 1
    fi

    # Find the process ID (PID) listening on port 5000
    PID=$(lsof -t -i:5000)

    if [[ -z "$PID" ]]; then
        echo "No process found bound to port 5000."
    else
        echo "Killing process with PID: $PID"
        kill -9 $PID
        echo "Process killed."
    fi

elif [[ "$USER_INPUT" == "no" ]]; then
    echo "No actions performed."
else
    echo "Invalid input. Please enter 'yes' or 'no'."
    exit 1
fi
exit 0
