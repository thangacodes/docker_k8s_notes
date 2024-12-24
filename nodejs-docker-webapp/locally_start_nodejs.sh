#!/bin/bash
# Print the current date and time
echo "The script was executed at:" $(date '+ %d-%m-%Y %H:%M:%S')
echo
# Inform the user that the app will be started
echo "Starting Node.js application locally without using Docker build..."
# Check if node_modules folder exists, if not, install dependencies
if [ ! -d "node_modules" ]; then
    echo "Installing dependencies..."
    npm install
else
    echo "Dependencies already installed."
fi
# Start the server
echo "Starting the server..."
npm start
# Open the application in the default browser
echo "Opening the application in your default browser..."
echo
# Platform-specific browser opening (macOS, Linux, Windows support)
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    open -a "Google Chrome" http://localhost:5000/
elif [[ "$OSTYPE" == "cygwin" ]]; then
    # Windows (Cygwin)
    start chrome http://localhost:5000/
else
    echo "Platform not supported for automatic browser opening."
fi
# Prompt to remove node_modules and package-lock.json
read -p "Do you want to remove node_modules folder and package-lock.json from the path $(pwd): ? " USER_INPUT

if [[ "$USER_INPUT" == "yes" || "$USER_INPUT" == "YES" ]]; then 
    echo "Removing node_modules and package-lock.json files and folders..."
    rm -rf node_modules package-lock.json
    exit 0
else
    echo "Exiting without removing files."
    exit 0
fi
exit 0
