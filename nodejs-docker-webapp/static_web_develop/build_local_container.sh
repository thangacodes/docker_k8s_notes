#!/bin/bash
echo "The script was executed at:" $(date '+%d-%m-%Y %H:%M:%S')
echo 
docker build -t simple-node-app .
docker run -p 5000:5000 static-web-app
echo