#!/bin/bash
echo "The script was executed at:" $(date '+%d-%m-%Y %H:%M:%S')
echo 
docker build -t node-app .
docker run -p 5000:5000 node-app
exit 0
