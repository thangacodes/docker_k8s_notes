#!/bin/bash
echo "The script was executed at:" $(date '+%Y-%m-%d %H:%M:%S')
# Check if port 5001 is being used
PID=$(lsof -t -i :5001)

if [ -z "$PID" ]; then
echo "Port 5001 is not in use."
else
# Output the process information using port 5001
echo "Port 5001 is being used by the following process(es):"
lsof -i :5001
# Kill the process using port 5001
echo "Killing process with PID: $PID"
kill -9 $PID
echo "Process killed successfully."
fi