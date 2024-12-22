#!/bin/bash
echo
# Print the current date and time of script execution
echo "The script was executed at:" $(date '+%d-%m-%Y %H:%M:%S')
echo 
# Check if VPN is connected and determine the VPN connection type
if [[ -n $(ifconfig | grep 'utun4') && $(ifconfig utun4 | grep 'inet') ]]; then
    # VPN is connected, assume it's Palo Alto
    VPNIP=$(ifconfig utun4 | grep inet | grep -v inet6 | awk '{print $2}')
    echo "Your MacBook is connected with VPN."
    echo
    echo "Your macOS VPN IP address is: $VPNIP"
    IP_ADDRESS=$VPNIP  # Set VPN IP address
else
    # No VPN connected, use en0 for the default IP
    NOVPNIP=$(ipconfig getifaddr en0)
    echo "Note, your laptop doesn't connected to the VPN client."
    echo
    echo "Your macOS IP address is: $NOVPNIP"
    echo 
    IP_ADDRESS=$NOVPNIP  # Set local IP address
fi
echo 
echo "Script to activate Python3 venv on linux/macOS machine.."

# Ask user for virtual environment name
read -p "Please enter the venv name: " venv_name 
echo "You have entered your virtual environment name as: $venv_name"

# Create virtual environment
python3 -m venv "$venv_name"

# Activate virtual environment
source "$venv_name/bin/activate"
echo "Your Python virtual environment '$venv_name' is activated."

# Install Flask in the virtual environment
pip install --upgrade pip
pip3 install Flask
# Check if app.py exists before running Flask
if [[ ! -f "app.py" ]]; then
    echo "Error: app.py not found in the current directory."
    exit 1
fi

# Run the Flask app in the background
python3 app.py &

# Sleep to allow time for the Flask app to start
echo "Sleeping for 3 seconds to allow Flask app to start..."
sleep 3

# Open Chrome browser and redirect to localhost with the correct IP address (VPN or Local)
echo "Opening the Flask app in Google Chrome..."
open -a "Google Chrome" http://${IP_ADDRESS}:5001 &

# Exit the script
exit 0
