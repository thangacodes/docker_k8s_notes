#!/bin/bash
echo "The script was executed at:" $(date '+%Y-%m-%d %H:%M:%S')
echo "Script to activate Python3 venv on linux/macOS machine.."
read -p "Please enter the venv name: " venv_name 
echo "you have entered your virutal env name as: " $venv_name
python3 -m venv "$venv_name"
source "$venv_name/bin/activate"
echo "Your Python virtual environment '$venv_name' is activated."
# Install Flask in the virtual environment
pip3 install Flask
# Run the Flask app
python3 app.py &
# Sleep to allow time for the Flask app to start
sleep 5
# Open Chrome browser and redirect to localhost:5000
# This assumes you're running a Unix-like system with Chrome installed.
open -a "Google Chrome" http://localhost:5000 &

# Exit the script
exit 0